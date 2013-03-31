class Array

  def similarity(other)
    (((self & other).size.to_f / self.size.to_f) * 100).to_i
  end

end

