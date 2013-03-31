require_relative "../lib/categorizes_tweets"
require_relative "../lib/imported_tweet"

# I accidentally an integration spec
describe CategorizesTweets do

  before do # I bet you didn't see that one coming

    @ruby_tweet = ImportedTweet.create([
      '318169735143493632',
      '2013-03-31 01:15:50 +0000',
      'gilesgoatboy',
      'ruby ruby ruby!'
    ])

    @music_tweet = ImportedTweet.create([
      '318169735143493632',
      '2013-03-31 01:15:50 +0000',
      'gilesgoatboy',
      'music music music!'
    ])

    @categorizes_tweets = CategorizesTweets.new
    @categorizes_tweets.categories = {:ruby  => "ruby",
                                      :music => "music"}
  end

  it "performs trivial string matching" do
    categorized_tweets = @categorizes_tweets.categorize!(@ruby_tweet)
    categorized_tweets.should == {:ruby => [@ruby_tweet]}

    categorized_tweets = @categorizes_tweets.categorize!(@music_tweet)
    categorized_tweets.should == {:music => [@music_tweet]}
  end

  it "works against mulitple tweets" do
    pending
    categorized_tweets = @categorizes_tweets.categorize!(@ruby_tweet, @music_tweet)
    categorized_tweets.should == {:ruby => [@ruby_tweet], :music => [@music_tweet]}
  end

end

