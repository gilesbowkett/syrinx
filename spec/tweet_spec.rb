require_relative '../lib/tweet'

describe Tweet do
  before do
    # FIXME: dry (factory girl -esque)
    @tweet = Tweet.new([
      '318713868924903424',
      '2013-04-01 13:18:02 +0000',
      'adafruit',
      'Story Tape http://t.co/1KXSm9ED1G'
    ])
  end

  it "generates a URL for itself" do
    @tweet.url.should == 'https://twitter.com/adafruit/status/318713868924903424'
  end

end

