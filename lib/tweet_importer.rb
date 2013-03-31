require 'csv'

class TweetImporter

  def self.parse(attributes)
    ImportedTweet.new(
      attributes[0].to_i,
      attributes[1],
      attributes[2],
      attributes[3]
    )
  end

  def self.import!
    CSV.read("since.csv").collect do |line|
      TweetImporter.parse(line)
    end
  end

end

class ImportedTweet < Struct.new(
  :id,
  :timestamp,
  :username,
  :text)
end

