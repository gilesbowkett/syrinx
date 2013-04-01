require_relative '../lib/link_filter'

describe LinkFilter do

  before do
    # FIXME: wait this might be stupid; why not just send it args like normal Struct?
    @tweet = Tweet.new([ 
      '318713868924903424',
      '2013-04-01 13:18:02 +0000',
      'adafruit',
      'Story Tape http://t.co/1KXSm9ED1G'
    ])
  end

  it "filters links" do
    LinkFilter.from(@tweet.text).should == 'http://t.co/1KXSm9ED1G'
  end

  it "survives random remarks" do
    @tweet.text = "marbles"
    LinkFilter.from(@tweet.text).should be_nil
  end

end
