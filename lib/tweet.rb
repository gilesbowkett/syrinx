class Tweet < Struct.new(
  :id,
  :timestamp,
  :username,
  :text)

  attr_accessor :retweets, :cookie_cutter

  def self.create(attributes)
    tweet = new(*attributes)
    tweet.retweets = []
    tweet
  end
end

