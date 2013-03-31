require_relative '../lib/array_similarity'

describe Array do

  context "#similarity" do
    it "calls identical Arrays 100% similar" do
      ["foo"].similarity(["foo"]).should == 100
    end

    it "calls non-intersecting Arrays 0% similar" do
      ["foo"].similarity(["bar"]).should == 0
    end

    it "measures similarity sort of as set intersection" do
      ["foo", "bar"].similarity(["bar", "baz"]).should == 50
    end
  end

end

