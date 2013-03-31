require File.join(File.dirname(__FILE__), '../lib/tweet_importer')

describe TweetImporter do

  before do
    @csv = ['318169735143493632','2013-03-31 01:15:50 +0000','gilesgoatboy',
            '"hacking a mini-app for Twitter summarization/undramafication ' + 
            'which uses the excellent unix-y t gem by Mr. @sferik. so ' +
            'far, very very good"']
  end

  it "parses tweets from CSV lines" do
    imported = TweetImporter.parse(@csv)

    imported.should be_instance_of ImportedTweet
    imported.id.should         == 318169735143493632
    imported.timestamp.should  == '2013-03-31 01:15:50 +0000'
    imported.username.should   == 'gilesgoatboy'
    imported.text.should       == '"hacking a mini-app for Twitter summarization/undramafication ' + 
                                  'which uses the excellent unix-y t gem by Mr. @sferik. so ' +
                                  'far, very very good"'

  end

  it "gets its CSV lines from a CSV file" do
    CSV.should_receive(:read).with("since.csv").and_return @csv
    TweetImporter.import!
  end

  it "stores the tweets in a database"

end

