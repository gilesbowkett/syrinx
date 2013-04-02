class CategorizesTweets
  attr_accessor :categories

  # FIXME: ugh. this very likely calls for Category objects, i.e.,
  # Category < Struct.new(:name, :qualifying_terms, :tweets). then
  # you replace the :categories Hash with Categories instead.
  def categorize!(*tweets)
    categorized = tweets.inject({}) do |memo, tweet|
      categories.each do |category, qualifying_terms|
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

