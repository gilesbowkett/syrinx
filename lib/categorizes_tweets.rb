class Category < Struct.new(:name, :qualifying_terms)
  def include?(tweet)
    qualifying_terms.each do |qualifying_term|
      return true if tweet.text.include? qualifying_term
    end
    return false
  end
end

class CategorizesTweets
  attr_accessor :categories

  # FIXME: ugh. this very likely calls for Category objects, i.e.,
  # Category < Struct.new(:name, :qualifying_terms, :tweets). then
  # you replace the :categories Hash with Categories instead.
  def categorize!(*tweets)
    categorized = tweets.inject({}) do |memo, tweet|
      categories.each do |category|
        if category.include? tweet
          if memo[category.name]
            memo[category.name] << tweet
          else
            memo[category.name] = [tweet]
          end
        end
      end
      memo
    end
  end

end

