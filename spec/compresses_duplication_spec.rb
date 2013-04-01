require_relative '../lib/compress_duplication'

describe CompressesDuplication do

  before do
    @tweet = Tweet.create([
      '318169735143493632',
      '2013-03-31 01:15:50 +0000',
      'gilesgoatboy',
      'hello world'
    ])
    @retweet = Tweet.create([
      '318169735143493632',
      '2013-03-31 01:15:50 +0000',
      'stalker',
      'RT @gilesgoatboy: hello world'
    ])
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

  it "tells a Tweet how many RTs it has" do
    pending
    tweets = [@tweet, @retweet]

    CompressesDuplication.filter(tweets)
    @tweet.retweets.should == [@retweet]
  end





  it "tells a Tweet how many similar tweets it has"
    # maybe with `tweet.similar = 10`
    # or `tweet.similar_tweets = [@similar_tweet]`
    # the idea being that RTs are in the 80-90% similar range,
    # and 60-80% is worth knowing about too, at least for now

  it "somehow ensures the invisibility of cookie-cutter tweets"
    # maybe with `tweet.cookie_cutter = true`
    # or even `tweet.parent = @other_tweet`

  it "finds multiple RT-ed tweets (and their RTs) in an array"

end

