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
    tweets.stepwise do |tweet1, tweet2|
      if retweet?(tweet1, tweet2)
        tweet2.cookie_cutter = true
        tweet1.retweets << tweet2
      end
    end
  end

end

