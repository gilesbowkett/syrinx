require "./lib/tweet"
require "./lib/tweet_importer"
require "./lib/link_filter"

# import tweets
tweet_importer = TweetImporter.new
tweets = tweet_importer.import!

# get tweets with links
tweets_with_links = LinkFilter.collect_tweets_with_links(tweets)

# shell output
puts
puts "new links!"
tweets_with_links.each do |tweet|
  puts "  " + LinkFilter.extract_link(tweet.text) + "        (via #{tweet.username})"
end
puts

