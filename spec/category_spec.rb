require_relative "../lib/category"
require_relative "../lib/tweet"

describe Category do
  before do
    @ruby = Category.new(:ruby, ["ruby"])
    @music = Category.new(:music, ["music"])
    @ruby_tweet = Tweet.new(
      '318169735143493632',
      '2013-03-31 01:15:50 +0000',
      'gilesgoatboy',
      'ruby ruby ruby!'
    )
  end

  it "knows what fits within it" do
    @ruby.include?(@ruby_tweet).should be_true
  end

  it "ignores case" do
    @ruby_tweet.text = "I like Ruby"
    @ruby.include?(@ruby_tweet).should be_true
  end

  it "ignores URLs in tweets" do
    @ruby_tweet.text = "blah blah blah http://t.co/music12345"
    @music.include?(@ruby_tweet).should be_false
  end

  it "knows what doesn't fit" do
    @music.include?(@ruby_tweet).should be_false
  end
end

