require_relative '../lib/compress_duplication'

describe CompressesDuplication do

  before do

    @tweet = Tweet.new(
      '318169735143493632',
      '2013-03-31 01:15:50 +0000',
      'gilesgoatboy',
      'hello world'
    )

    @retweet = Tweet.new(
      '318169735143493632',
      '2013-03-31 01:15:50 +0000',
      'stalker',
      'RT @gilesgoatboy: hello world'
    )

  end

  context "identifying retweets" do
    it "spots the obvious" do
      CompressesDuplication.literal_retweet?(@tweet, @retweet).should be_true
    end

    it "catches more organic permutations" do
      @retweet.text = "awesome! RT @gilesgoatboy hello world"
      CompressesDuplication.literal_retweet?(@tweet, @retweet).should be_true
    end

    it "catches paraphrases" do
      @retweet.text = "awesome! MT @gilesgoatboy hello mars"
      CompressesDuplication.retweet?(@tweet, @retweet).should be_true
    end

    it "retweeting replies" do
      @tweet.text = "@world hello!"
      @retweet.text = "RT @gilesgoatboy @world hello!"
      CompressesDuplication.retweet?(@tweet, @retweet).should be_true
    end

    context "avoiding false positives" do
      it "spots the obvious" do
        @retweet.text = "I like turtles"
        CompressesDuplication.retweet?(@tweet, @retweet).should be_false
      end

      it "similar structure, unrelated user/content" do
        @retweet.text = "RT @curiousityrover hello mars"
        CompressesDuplication.retweet?(@tweet, @retweet).should be_false
      end
    end

  end

  context "#filter" do
    it "somehow ensures the invisibility of cookie-cutter tweets" do
      CompressesDuplication.filter([@tweet, @retweet])
      @retweet.cookie_cutter.should be_true
    end

    it "does not mislabel original tweets as retweets" do
      CompressesDuplication.filter([@tweet, @retweet])
      @tweet.cookie_cutter.should be_false
    end

    it "tells a Tweet how many RTs it has" do
      tweets = [@tweet, @retweet]

      CompressesDuplication.filter(tweets)
      @tweet.retweets.should == [@retweet]
    end

    context 'more than just one or two tweets' do
      it "assigns multiple RTs" do
        @additional_retweet = Tweet.new(
          '318169735143493632',
          '2013-03-31 01:15:50 +0000',
          'parrot',
          'RT @gilesgoatboy: hello world!'
        )
        tweets = [@tweet, @retweet, @additional_retweet]

        CompressesDuplication.filter(tweets)
        @tweet.retweets.should == [@retweet, @additional_retweet]
      end

      it "assigns RTs to multiple tweets" do
        @other_tweet = Tweet.new(
          '318169735143493632',
          '2013-03-31 01:15:50 +0000',
          'tree',
          'current status: standing'
        )
        @other_retweet = Tweet.new(
          '318169735143493632',
          '2013-03-31 01:15:50 +0000',
          'fanoftrees',
          'RT @tree current status: standing'
        )
        tweets = [@tweet, @retweet, @other_tweet, @other_retweet]

        CompressesDuplication.filter(tweets)
        @tweet.retweets.should == [@retweet]
        @other_tweet.retweets.should == [@other_retweet]
      end
    end
  end

end

