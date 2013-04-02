class LinkFilter

  def self.extract_link(text)
    url_match = text.match(/(http:\/\/t.co\S{11})/)
    if url_match
      url_match[0]
    end
  end

  def self.collect_tweets_with_links(tweets)
    (tweets.collect do |tweet|
      tweet if extract_link(tweet.text)
    end).compact
  end

end

