# toy example only. see readme.md for more info

require "./lib/tweet"
require "./lib/tweet_importer"
require "./lib/category"
require "./lib/categorizes_tweets"
require "./lib/link_filter"

require 'erb'

# import tweets
tweet_importer = TweetImporter.new
tweets = tweet_importer.import!

# define categories
ruby = Category.new(:ruby, %w{ruby rails rspec})
javascript = Category.new(:javascript, %w{node.js javascipt js npm backbone ember})
music = Category.new(:music, %w{drum moombahton music})

# categorize tweets
categorizes_tweets = CategorizesTweets.new
categorizes_tweets.categories = [ruby, music, javascript]
categorized = categorizes_tweets.categorize!(*tweets)

# get tweets with links
tweets_with_links = categorized.inject({}) do |memo, (category, tweets)|
  memo[category] = LinkFilter.collect_tweets_with_links(tweets)
  memo
end

# ERb output
template = File.read(File.expand_path(File.dirname(__FILE__)) + "/template.erb")
File.open(File.expand_path(File.dirname(__FILE__)) + "/public/index.html", "w") do |file|
  file.puts ERB.new(template).result(binding)
end

