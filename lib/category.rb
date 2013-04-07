class Category < Struct.new(:name, :qualifying_terms)

  def include?(tweet)
    qualifying_terms.each do |qualifying_term|
      return true if LinkFilter.remove_link(tweet.text).match /#{qualifying_term}/i
    end
    false
  end

end

