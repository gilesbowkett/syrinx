require_relative '../lib/stepwise_array_operation'

describe Array do
  it "performs an operation on each element, against every other element" do
    memo = []
    [2, 3, 4].stepwise do |element1, element2|
      memo << element1 * element2
    end
    memo.should == [6, 8, 6, 12, 8, 12]
  end
end

