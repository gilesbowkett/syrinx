class TweetImporter
  def self.parse(attributes)
    ImportedTweet.new(
      :id         => attributes[0],
      :timestamp  => attributes[1],
      :username   => attributes[2],
      :text       => attributes[3]
    )
  end
end

class ImportedTweet < Struct.new(:id,
                                 :timestamp,
                                 :username,
                                 :text); end

