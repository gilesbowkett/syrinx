class LinkFilter
  FINDS_LINK = /\s*(http:\/\/t.co\S{11})/

  def self.extract_link(text)
    url_match = text.match(FINDS_LINK)
    if url_match
      url_match[1]
    end
  end

  def self.remove_link(text)
    text.gsub(FINDS_LINK, '')
  end

  def self.collect_tweets_with_links(tweets)
    (tweets.collect do |tweet|
      tweet if extract_link(tweet.text)
    end).compact
  end

end

