require_relative "../lib/categorizes_tweets"
require_relative "../lib/tweet"

describe CategorizesTweets do

  before do

    @ruby_tweet = Tweet.new(
      '318169735143493632',
      '2013-03-31 01:15:50 +0000',
      'gilesgoatboy',
      'ruby ruby ruby!'
    )

    @music_tweet = Tweet.new(
      '318169735143493632',
      '2013-03-31 01:15:50 +0000',
      'gilesgoatboy',
      'music music music!'
    )

    @categorizes_tweets = CategorizesTweets.new
    @categorizes_tweets.categories = {:ruby  => ["ruby"],
                                      :music => ["music"]}
  end

  it "performs trivial string matching" do
    categorized_tweets = @categorizes_tweets.categorize!(@ruby_tweet)
    categorized_tweets.should == {:ruby => [@ruby_tweet]}

    categorized_tweets = @categorizes_tweets.categorize!(@music_tweet)
    categorized_tweets.should == {:music => [@music_tweet]}
  end

  it "works against multiple tweets" do
    categorized_tweets = @categorizes_tweets.categorize!(@ruby_tweet, @music_tweet)
    categorized_tweets.should == {:ruby => [@ruby_tweet], :music => [@music_tweet]}
  end

  context "against multiple terms" do
    before do
      @rails_tweet = Tweet.new(
        '318169735143493632',
        '2013-03-31 01:15:50 +0000',
        'gilesgoatboy',
        'rails is a great programming language!'
      )
      @categorizes_tweets.categories = {:ruby  => ["ruby", "rails"],
                                        :music => ["music"]}
    end

    it "works for one tweet" do
      categorized_tweets = @categorizes_tweets.categorize!(@rails_tweet)
      categorized_tweets.should == {:ruby => [@rails_tweet]}
    end

    it "works for multiple tweets" do
      categorized_tweets = @categorizes_tweets.categorize!(@ruby_tweet, @rails_tweet, @music_tweet)
      categorized_tweets.should == {:ruby => [@ruby_tweet, @rails_tweet],
                                    :music => [@music_tweet]}
    end
  end

  # this kind of redundancy doesn't bother me. if I go to Twitter because I'm curious
  # about Ruby news, and I see news about Ruby and music, that's cool with me. same
  # thing if I wanted music news. so for now this is fine.
  it "permits set overlap" do
    ruby_music_tweet = Tweet.new(
      '318169735143493632',
      '2013-03-31 01:15:50 +0000',
      'gilesgoatboy',
      'using ruby to make music!'
    )

    categorized_tweets = @categorizes_tweets.categorize!(ruby_music_tweet)
    categorized_tweets.should == {:ruby => [ruby_music_tweet],
                                  :music => [ruby_music_tweet]}
  end

end

