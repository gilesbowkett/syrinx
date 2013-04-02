require "./lib/tweet"
require "./lib/tweet_importer"
require "./lib/categorizes_tweets"
require "./lib/link_filter"

# import tweets
@tweet_importer = TweetImporter.new
@tweets = @tweet_importer.import!

# categorize them
@categorizes_tweets = CategorizesTweets.new
@categorizes_tweets.category_keywords = {:ruby  => ["ruby"],    # FIXME: better term list
                                         :music => ["music"]}   # (this is a toy example)
categorized = @categorizes_tweets.categorize!(*@tweets)

# get tweets with links
tweets_with_links = {}
categorized.each do |category, tweets|
  tweets_with_links[category] = LinkFilter.collect_tweets_with_links(tweets)
end

# shell output
puts
puts "new links by category!"
tweets_with_links.each do |category, tweets|
  puts category
  tweets.each do |tweet|
    puts "  " + LinkFilter.extract_link(tweet.text) + "        (via #{tweet.username})"
  end
end
puts

