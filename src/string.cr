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
    return self if search.empty?

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
  # Get the portion of a string before the first occurrence of a given value.
  #
  # ```
  # require "support/string"
  #
  # "This is my name".before("my name") # => "This is "
  # ```
  #
  def before(search : String) : String
    return self if search.empty?

    index = self.index(search)

    if index
      return self[0...index]
    end

    return self
  end

  #
  # :ditto:
  #
  def before(search : Int32) : String
    return self.before(search.to_s)
  end

  #
  # Get the portion of a string before the last occurrence of a given value.
  #
  # ```
  # require "support/string"
  #
  # "This is my name".before_last("is") # => "This "
  # ```
  #
  def before_last(search : String) : String
    return self if search.empty?

    index = self.rindex(search)

    if index
      return self[0...index]
    end

    return self
  end

  #
  # :ditto:
  #
  def before_last(search : Int32) : String
    return self.before_last(search.to_s)
  end
end
