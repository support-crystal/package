require "spec"
require "../src/string"

describe String do
  it "after" do
    "hannah".after("han").should eq "nah"
    "hannah".after("n").should eq "nah"
    "ééé hannah".after("han").should eq "nah"
    "hannah".after("xxxx").should eq "hannah"
    "hannah".after("").should eq "hannah"
    "han0nah".after("0").should eq "nah"
    "han0nah".after(0).should eq "nah"
    "han2nah".after(2).should eq "nah"
  end

  it "reverse" do
    "FooBar".reverse.should eq "raBooF"
    "Teniszütő".reverse.should eq "őtüzsineT"
    "❤MultiByte☆".reverse.should eq "☆etyBitluM❤"
  end
end
