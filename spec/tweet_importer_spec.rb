require_relative '../lib/tweet_importer'
require_relative '../lib/imported_tweet'

describe TweetImporter do

  before do

    @tweet_importer = TweetImporter.new

    @text = '"hacking a mini-app for Twitter summarization/undramafication ' + 
            'which uses the excellent unix-y t gem by Mr. @sferik. so ' +
            'far, very very good"'

    @line = ['318169735143493632',
             '2013-03-31 01:15:50 +0000',
             'gilesgoatboy',
             @text]

    @attributes = {
      :id        =>  318169735143493632,
      :timestamp => '2013-03-31 01:15:50 +0000',
      :username  => 'gilesgoatboy',
      :text      => @text
    }

  end

  it "parses tweets from CSV lines" do
    imported = @tweet_importer.parse(@line)
    imported.should be_instance_of ImportedTweet
    imported.to_h.should == @attributes
  end

  it "imports tweets from a CSV file" do
    CSV.stub(:read).with("since.csv") { [@line] }
    imported_tweets = @tweet_importer.import!
    imported_tweets[0].should be_instance_of ImportedTweet
  end

  class TweetRecord; end

  it "stores tweets in a database" do
    @tweet_importer.tweets = [@tweet_importer.parse(@line)]
    TweetRecord.should_receive(:create).with(@attributes)
    @tweet_importer.persist!
  end

end

