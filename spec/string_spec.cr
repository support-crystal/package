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

  it "between_first" do
    "abc".between_first("", "c").should eq "abc"
    "abc".between_first("a", "").should eq "abc"
    "abc".between_first("", "").should eq "abc"
    "abc".between_first("a", "c").should eq "b"
    "dddabc".between_first("a", "c").should eq "b"
    "abcddd".between_first("a", "c").should eq "b"
    "dddabcddd".between_first("a", "c").should eq "b"
    "hannah".between_first("ha", "ah").should eq "nn"
    "[a]ab[b]".between_first("[", "]").should eq "a"
    "hannah".between_first("ha", "ah").should eq "nn"
    "[a]ab[b]".between_first("[", "]").should eq "a"
    "foofoobar".between_first("foo", "bar").should eq "foo"
    "foobarbar".between_first("foo", "bar").should eq ""
  end

  it "kebab" do
    "SupportPackage".kebab.should eq "support-package"
    "Support Package".kebab.should eq "support-package"
    "Support ❤Package".kebab.should eq "support❤-package"
    "".kebab.should eq ""
  end

  it "lcfirst" do
    "".lcfirst.should eq ""
    "Support".lcfirst.should eq "support"
    "Crystal Support".lcfirst.should eq "crystal Support"
    "Мама".lcfirst.should eq "мама"
    "Мама мыла раму".lcfirst.should eq "мама мыла раму"
  end

  it "lower" do
    "FOO BAR BAZ".lower.should eq "foo bar baz"
    "foO bAr BaZ".lower.should eq "foo bar baz"
  end

  it "snake" do
    "CRYSTALPackage".snake.should eq "c_r_y_s_t_a_l_package"
    "CrystalPackage".snake.should eq "crystal_package"
    "Crystal   Package".snake.should eq "crystal_package"

    "foo-bar".snake.should eq "foo-bar"
    "Foo-Bar".snake.should eq "foo-_bar"
    "Foo_Bar".snake.should eq "foo__bar"
    "ŻółtaŁódka".snake.should eq "żółtałódka"
  end

  it "take" do
    "abcdef".take(2).should eq "ab"
    "abcdef".take(-2).should eq "ef"
    "abcdef".take(-10).should eq "abcdef"
    "abcdef".take(0).should eq ""
    "".take(2).should eq ""
    "abcdef".take(10).should eq "abcdef"
    "üöä".take(1).should eq "ü"
  end
end
