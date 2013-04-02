class Tweet < Struct.new(
  :id,
  :timestamp,
  :username,
  :text)

  attr_accessor :retweets, :cookie_cutter

  def initialize(*attributes)
    raise "instantiation error" if attributes[0].is_a? Array
    super(*attributes)
    self.retweets = []
    self
  end

  def url
    "https://twitter.com/#{username}/status/#{id}"
  end

end

