class String
  #
  # Reverse the given string.
  #
  # ```
  # require "support/string"
  #
  # "Hello".reverse   # => "olleH"
  # "Crystal".reverse # => "latsyrC"
  # ```
  #
  def reverse : String
    return self.chars.reverse.join
  end
end
