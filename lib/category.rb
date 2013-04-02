class Category < Struct.new(:name, :qualifying_terms)

  def include?(tweet)
    qualifying_terms.each do |qualifying_term|
      return true if tweet.text.include? qualifying_term
    end
    return false
  end

end

