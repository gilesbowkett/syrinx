require_relative '../lib/stepwise_array_operation'

describe Array do
  it "performs an operation on each element, against every other element" do
    memo = []
    [2, 3, 4].stepwise do |element1, element2|
      memo << element1 * element2
    end
    memo.should == [6, 8, 6, 12, 8, 12]
  end

  it "can be used to implement a sort" do
    biggest = [2,3].comparing_collect do |element1, element2|
      element1 > element2
    end
    biggest.should == [3]
  end

  it "shouldn't be used to implement a sort" do
    biggest = [2,3,5].comparing_collect do |element1, element2|
      element1 > element2
    end
    biggest.should == [3,5]
  end
end

