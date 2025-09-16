# :nodoc:
struct Number
  #
  # Format the given number.
  #
  def self.format(number : Int32, separator : String = ",") : String
    str = number.abs.to_s
    reversed = str.reverse

    formatted = reversed.chars.each_with_index.map do |char, index|
      if index > 0 && index % 3 == 0
        separator + char
      else
        char
      end
    end.join.reverse

    if number < 0
      "-#{formatted}"
    else
      formatted
    end
  end
end
