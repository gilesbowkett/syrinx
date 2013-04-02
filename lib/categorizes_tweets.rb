class CategorizesTweets
  attr_accessor :category_keywords

  # FIXME: ugh
  def categorize!(*tweets)
    categorized = {}
    tweets.each do |tweet|
      category_keywords.each do |category, qualifying_terms|
        qualifying_terms.each do |qualifying_term|
          if tweet.text.include? qualifying_term
            if categorized[category]
              categorized[category] << tweet
            else
              categorized[category] = [tweet]
            end
          end
        end
      end
    end
    categorized
  end

end

