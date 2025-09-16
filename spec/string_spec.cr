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

  it "after_last" do
    "yvette".after_last("yve").should eq "tte"
    "yvette".after_last("t").should eq "e"
    "ééé yvette".after_last("t").should eq "e"
    "yvette".after_last("tte").should eq ""
    "yvette".after_last("xxxx").should eq "yvette"
    "yvette".after_last("").should eq "yvette"
    "yv0et0te".after_last("0").should eq "te"
    "yv0et0te".after_last(0).should eq "te"
    "----foo".after_last("---").should eq "foo"
  end

  it "reverse" do
    "FooBar".reverse.should eq "raBooF"
    "Teniszütő".reverse.should eq "őtüzsineT"
    "❤MultiByte☆".reverse.should eq "☆etyBitluM❤"
  end
end
