require 'ap'

class CategorizesTweets
  attr_accessor :categories

  def categorize!(*tweets)
    categorized = {}
    tweets.each do |tweet|
      categories.each do |category, qualifying_term|
        if tweet.text.include? qualifying_term
          categorized[category] = [tweet]
        end
      end
    end
    categorized
  end

end

