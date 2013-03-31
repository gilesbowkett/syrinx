require 'ap'

class CategorizesTweets
  attr_accessor :categories

  def categorize!(tweet)
    categorized = {}
    categories.each do |category, qualifying_term|
      if tweet.text.include? qualifying_term
        categorized[category] = [tweet]
      end      
    end
    categorized
  end

end

