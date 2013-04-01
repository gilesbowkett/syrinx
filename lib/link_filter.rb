class LinkFilter

  def self.from(text)
    url_match = text.match(/(http:\/\/t.co\S+)/)
    if url_match
      url_match[0]
    end
  end

  def self.collect(tweets)
    (tweets.collect do |tweet|
      tweet if from(tweet.text)
    end).compact
  end

end

