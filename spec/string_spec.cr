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

  it "before" do
    "hannah".before("nah").should eq "han"
    "hannah".before("n").should eq "ha"
    "ééé hannah".before("han").should eq "ééé "
    "hannah".before("xxxx").should eq "hannah"
    "hannah".before("").should eq "hannah"
    "han0nah".before("0").should eq "han"
    "han0nah".before(0).should eq "han"
    "han2nah".before(2).should eq "han"
    "".before("").should eq ""
    "a".before("a").should eq ""
    "foo@bar.com".before("@").should eq "foo"
    "foo@@bar.com".before("@").should eq "foo"
    "@foo@bar.com".before("@").should eq ""
  end

  it "before_last" do
    "yvette".before_last("tte").should eq "yve"
    "yvette".before_last("t").should eq "yvet"
    "ééé yvette".before_last("yve").should eq "ééé "
    "yvette".before_last("yve").should eq ""
    "yvette".before_last("xxxx").should eq "yvette"
    "yvette".before_last("").should eq "yvette"
    "yv0et0te".before_last("0").should eq "yv0et"
    "yv0et0te".before_last(0).should eq "yv0et"
    "yv2et2te".before_last(2).should eq "yv2et"
    "yvette".before_last("yvette").should eq ""
    "support package".before_last(" ").should eq "support"
    "yvette\\tyv0et0te".before_last("\\t").should eq "yvette"
  end

  it "between" do
    "abc".between("", "c").should eq "abc"
    "abc".between("a", "").should eq "abc"
    "abc".between("", "").should eq "abc"
    "abc".between("a", "c").should eq "b"
    "dddabc".between("a", "c").should eq "b"
    "abcddd".between("a", "c").should eq "b"
    "dddabcddd".between("a", "c").should eq "b"
    "hannah".between("ha", "ah").should eq "nn"
    "[a]ab[b]".between("[", "]").should eq "a]ab[b"
    "foofoobar".between("foo", "bar").should eq "foo"
    "foobarbar".between("foo", "bar").should eq "bar"
    "12345".between(1, 5).should eq "234"
    "12345".between("1", 5).should eq "234"
    "12345".between(1, "5").should eq "234"
    "123456789".between("123", "6789").should eq "45"
    "nothing".between("foo", "bar").should eq "nothing"
  end
end
