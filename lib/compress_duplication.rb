class CompressesDuplication

  def self.retweet?(first, second)
     literal_retweet?(first, second) || similar_and_mentions_user?(first, second)
  end

  def self.literal_retweet?(first, second)
    second.text =~ /RT @#{first.username}:? #{first.text}/
  end

  def self.similar_and_mentions_user?(first, second)
    similarity = first.text.split(" ").similarity(second.text.split(" "))
    similarity > 49 && second.text =~ /@#{first.username}/
  end

  def self.filter(tweets)
  end

end

