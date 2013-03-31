require 'csv'

class TweetImporter
  attr_accessor :tweets

  def parse(attributes)
    ImportedTweet.new(
      attributes[0].to_i,
      attributes[1],
      attributes[2],
      attributes[3]
    )
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

class ImportedTweet < Struct.new(
  :id,
  :timestamp,
  :username,
  :text)
end

