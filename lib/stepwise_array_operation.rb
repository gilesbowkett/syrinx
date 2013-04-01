class Array

  def stepwise
    self.each do |element1|
      self.each do |element2|
        next if element1 == element2
        yield element1, element2
      end
    end
  end

end

