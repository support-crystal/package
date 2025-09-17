require "./number"
require "./inflector"

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

  #
  # Get the portion of a string between two given values.
  #
  # ```
  # require "support/string"
  #
  # "This is my name".between("This", "name") # => " is my "
  # ```
  #
  def between(from : String, to : String) : String
    return self if from.empty? || to.empty?

    start_index = self.index(from)
    return self unless start_index

    start_index += from.size
    end_index = self.rindex(to, self.size - 1)
    return self unless end_index && end_index > start_index

    return self[start_index...end_index]
  end

  #
  # :ditto:
  #
  def between(from : Int32, to : Int32) : String
    return self.between(from.to_s, to.to_s)
  end

  #
  # :ditto:
  #
  def between(from : String, to : Int32) : String
    return self.between(from, to.to_s)
  end

  #
  # :ditto:
  #
  def between(from : Int32, to : String) : String
    return self.between(from.to_s, to)
  end

  #
  # Get the smallest possible portion of a string between two given values.
  #
  # ```
  # require "support/string"
  #
  # "[a] bc [d]".between_first("[", "]") # => "a"
  # ```
  #
  def between_first(from : String, to : String) : String
    return self if from.empty? || to.empty?

    start_index = self.index(from)
    return self unless start_index

    start_index += from.size
    end_index = self.index(to, start_index)
    return self unless end_index && end_index >= start_index

    return self[start_index...end_index]
  end

  #
  # :ditto:
  #
  def between_first(from : Int32, to : Int32) : String
    return self.between_first(from.to_s, to.to_s)
  end

  #
  # :ditto:
  #
  def between_first(from : String, to : Int32) : String
    return self.between_first(from, to.to_s)
  end

  #
  # :ditto:
  #
  def between_first(from : Int32, to : String) : String
    return self.between_first(from.to_s, to)
  end

  #
  # Convert a string to kebab case.
  #
  # ```
  # require "support/string"
  #
  # "fooBar".kebab # => "foo-bar"
  # ```
  #
  def kebab : String
    return self.snake("-")
  end

  #
  # Convert the first character of the given string to lower-case.
  #
  # ```
  # require "support/string"
  #
  # "Foo Bar".lcfirst # => "foo Bar"
  # ```
  #
  def lcfirst : String
    return self if self.empty?
    return self[0].downcase + self[1..-1]
  end

  #
  # Convert the given string to lower-case.
  #
  # ```
  # require "support/string"
  #
  # "CRYSTAL".lower # => "crystal"
  # ```
  #
  def lower : String
    return self.downcase
  end

  #
  # Remove all whitespace from the beginning of a string.
  #
  # ```
  # require "support/string"
  #
  # "   Crystal   ".ltrim # => "Crystal   "
  # ```
  #
  def ltrim : String
    return self.lstrip(" \t\r\n")
  end

  #
  # Get the plural form of an English word.
  #
  # ```
  # require "support/string"
  #
  # "car".plural   # => "cars"
  # "child".plural # => "children"
  # ```
  #
  # You may provide an integer as a second argument to the function to retrieve the singular or plural form of the string.
  #
  # ```
  # require "support/string"
  #
  # "car".plural(2)   # => "cars"
  # "child".plural(1) # => "child"
  # ```
  #
  # The `prepend_count` argument may be provided to prefix the pluralized string with the formatted `count`:
  #
  # ```
  # require "support/string"
  #
  # "car".plural(2, prepend_count: true)      # => "2 cars"
  # "child".plural(3000, prepend_count: true) # => "3,000 children"
  # ```
  #
  def plural(count : Int32 = 2, prepend_count : Bool = false) : String
    if count == 1
      if prepend_count
        return "#{Number.format(count)} #{self}"
      end

      return self
    end

    return "#{Number.format(count)} #{Inflector.pluralize(self)}" if prepend_count

    return Inflector.pluralize(self)
  end

  #
  # Remove all whitespace from the end of a string.
  #
  # ```
  # require "support/string"
  #
  # "   Crystal   ".rtrim # => "   Crystal"
  # ```
  #
  def rtrim : String
    return self.rstrip(" \t\r\n")
  end

  #
  # Get the singular form of an English word.
  #
  # ```
  # require "support/string"
  #
  # "cars".singular     # => "car"
  # "children".singular # => "child"
  # ```
  #
  def singular : String
    return Inflector.singularize(self)
  end

  #
  # Convert a string to snake case.
  #
  # ```
  # require "support/string"
  #
  # "fooBar".snake      # => "foo_bar"
  # "fooBar".snake("-") # => "foo-bar"
  # ```
  #
  def snake(delimiter : String = "_") : String
    return self if self == self.lower

    return self
      .gsub(/\s+/, "")
      .gsub(/(.)(?=[A-Z])/, "\\1#{delimiter}")
      .lower
  end

  #
  # Take the first or last `limit` characters of a string.
  #
  # ```
  # require "support/string"
  #
  # "Build something amazing!".take(5) # => "Build"
  # ```
  #
  def take(limit : Int32) : String
    if limit < 0
      limit = [self.size, -limit].min
      return self[-limit, limit]
    end

    return self[0, limit]? || ""
  end

  #
  # Make a string's first character uppercase.
  #
  # ```
  # require "support/string"
  #
  # "foo bar".ucfirst # => "Foo bar"
  # ```
  #
  def ucfirst : String
    return self if self.empty?
    return self[0].upcase + self[1..-1]
  end

  #
  # Convert the given string to upper-case.
  #
  # ```
  # require "support/string"
  #
  # "crystal".upper # => "CRYSTAL"
  # ```
  #
  def upper : String
    return self.upcase
  end
end
