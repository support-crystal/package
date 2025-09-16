class String
  #
  # Return the remainder of a string after the first occurrence of a given value.
  #
  # ```
  # require "support/string"
  #
  # "Crystal Package".after("Crystal ") # => "Package"
  # ```
  #
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
  # Return the remainder of a string after the last occurrence of a given value.
  #
  # ```
  # require "support/string"
  #
  # "App\\Http\\Controllers\\Controller".after_last("\\") # => "Controller"
  # ```
  #
  def after_last(search : String) : String
    if search.empty?
      return self
    end

    index = self.rindex(search)

    if index
      return self[(index + search.size)..-1]
    end

    return self
  end

  #
  # :ditto:
  #
  def after_last(search : Int32) : String
    return self.after_last(search.to_s)
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
