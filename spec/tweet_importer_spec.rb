require_relative '../lib/tweet_importer'

describe TweetImporter do

  before do
    @text = '"hacking a mini-app for Twitter summarization/undramafication ' + 
            'which uses the excellent unix-y t gem by Mr. @sferik. so ' +
            'far, very very good"'
    @line = ['318169735143493632',
             '2013-03-31 01:15:50 +0000',
             'gilesgoatboy',
             @text]
  end

  it "parses tweets from CSV lines" do
    imported = TweetImporter.parse(@line)
    imported.should be_instance_of ImportedTweet

    imported.id.should         == 318169735143493632
    imported.timestamp.should  == '2013-03-31 01:15:50 +0000'
    imported.username.should   == 'gilesgoatboy'
    imported.text.should       == @text
  end

  it "gets its CSV lines from a CSV file" do
    CSV.stub(:read).with("since.csv") { [@line] }
    imported_tweets = TweetImporter.import!
    imported_tweets[0].should be_instance_of ImportedTweet
  end

  it "stores the tweets in a database"

end

