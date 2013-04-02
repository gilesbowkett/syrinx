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

  it "extracts links" do
    LinkFilter.extract_link(@tweet.text).should == 'http://t.co/1KXSm9ED1G'
  end

  it "survives random remarks" do
    @tweet.text = "marbles"
    LinkFilter.extract_link(@tweet.text).should be_nil
  end

  it "collects tweets with links" do
    other_tweet = Tweet.new([ 
      '318713868924903424',
      '2013-04-01 13:18:02 +0000',
      'adafruit',
      'I like turtles'
    ])
    LinkFilter.collect_tweets_with_links([@tweet, other_tweet]).should == [@tweet]
  end

end

