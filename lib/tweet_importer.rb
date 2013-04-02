require 'csv'

class TweetImporter
  attr_accessor :tweets

  def parse(*attributes)
    Tweet.new(*attributes)
  end

  def import!
    CSV.read("since.csv").collect do |line|
      parse(line)
    end
  end

  def persist!
    tweets.each do |tweet|
      TweetRecord.create(tweet.to_h)
    end
  end

end

