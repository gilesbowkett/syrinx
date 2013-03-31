require_relative '../lib/wheatley_arrays'

# FIXME: this is from my powerful but messy JavaScript repetition
# detector and I guess "robot refactoring assistant" Wheatley.
# it's written in Ruby and it can do some very primitive automated
# refactoring of JavaScript, and some very powerful analysis of
# JavaScript too. it's kind of like a space ship made out of spare
# parts, and held together with duct tape and bubblegum. anyway,
# all this Array stuff should probably become ArrayComparator or
# RecognizesSimilarityInArrays or some such civilized thing.

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

