class Category < Struct.new(:name, :qualifying_terms)

  def include?(tweet)
    qualifying_terms.each do |qualifying_term|
      return true if tweet.text.include? qualifying_term
    end
    return false
  end

end

class CategorizesTweets
  attr_accessor :categories, :categorized
  def initialize
    @categorized = {}
  end

  # FIXME: SRP
  def add_to_categorized(category, tweet)
    if @categorized[category.name]
      @categorized[category.name] << tweet
    else
      @categorized[category.name] = [tweet]
    end
  end

  def categorize!(*tweets)
    categories.each do |category|
      tweets.each do |tweet|
        add_to_categorized(category, tweet) if category.include? tweet
      end
    end
    @categorized
  end

end

