class String
  #
  # Return the remainder of a string after the first occurrence of a given value.
  #
  # ```
  # "Crystal Package".after("Crystal ") # => "Package"
  # ```
  def after(search : String) : String
    index = self.index(search)

    if index
      return self[(index + search.size)..-1]
    end

    return self
  end

  #
  # :ditto:
  #
  def after(search : Int32) : String
    return self.after(search.to_s)
  end

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
