class Tweet < Struct.new(
  :id,
  :timestamp,
  :username,
  :text)

  attr_accessor :retweets, :cookie_cutter

  def self.create(attributes)
    tweet = new(
      attributes[0].to_i,
      attributes[1],
      attributes[2],
      attributes[3]
    )
    tweet.retweets = []
    tweet
  end
end

