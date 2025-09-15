require "spec"
require "../src/string"

describe String do
  it "reverse" do
    "FooBar".reverse.should eq "raBooF"
    "Teniszütő".reverse.should eq "őtüzsineT"
    "❤MultiByte☆".reverse.should eq "☆etyBitluM❤"
  end
end
