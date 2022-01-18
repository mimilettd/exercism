=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end

class Luhn
  def self.valid?(string)
    new(string).valid?
  end

  def initialize(string)
    @string = string
  end

  def valid?
    return false if invalid?

    arr = modified_characters.reverse.map.with_index do |e, i|
      if i.odd?
        double = e.to_i * 2
        double > 9 ? double - 9 : double
      else
        e.to_i
      end
    end

    arr.sum % 10 == 0 ? true : false
  end

  private
  attr_reader :string

  def modified_characters
    string.delete(' ').chars
  end

  def invalid?
    string_length_less_or_equal_to_one? ||
      contains_non_digit_characters?
  end

  def string_length_less_or_equal_to_one?
    modified_characters.length <= 1
  end

  def contains_non_digit_characters?
    string.scan(/\d/).length != modified_characters.length
  end
end
