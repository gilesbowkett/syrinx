class LinkFilter

  def self.extract_link(text)
    url_match = text.match(/\s*(http:\/\/t.co\S{11})/)
    if url_match
      url_match[1]
    end
  end

  def self.remove_link(text)
    text.gsub(/\s*(http:\/\/t.co\S{11})/, '')
  end

  def self.collect_tweets_with_links(tweets)
    (tweets.collect do |tweet|
      tweet if extract_link(tweet.text)
    end).compact
  end

end

