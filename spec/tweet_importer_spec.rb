require File.join(File.dirname(__FILE__), '../lib/tweet_importer')

describe TweetImporter do
  it "parses tweets from CSV lines" do
    csv = '318169735143493632,2013-03-31 01:15:50 +0000,gilesgoatboy,"hacking a mini-app for Twitter summarization/undramafication which uses the excellent unix-y t gem by Mr. @sferik. so far, very very good"'
    TweetImporter.parse(csv).should be_instance_of ImportedTweet
  end
  it "gets its CSV lines from a CSV file"
  it "stores the tweets in a database"
end

