class Tweet < Struct.new(
  :id,
  :timestamp,
  :username,
  :text)

  attr_accessor :retweets, :cookie_cutter

  def initialize(attributes)
    super(*attributes)
    self.retweets = []
    self
  end
end

