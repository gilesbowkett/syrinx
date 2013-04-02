class CategorizesTweets
  attr_accessor :category_keywords

  # FIXME: ugh
  def categorize!(*tweets)
    categorized = tweets.inject({}) do |memo, tweet|
      category_keywords.each do |category, qualifying_terms|
        qualifying_terms.each do |qualifying_term|
          if tweet.text.include? qualifying_term
            if memo[category]
              memo[category] << tweet
            else
              memo[category] = [tweet]
            end
          end
        end
      end
      memo
    end
  end

end

