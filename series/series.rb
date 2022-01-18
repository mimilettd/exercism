=begin
Write your code for the 'Series' exercise in this file. Make the tests in
`series_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/series` directory.
=end

class Series
  def initialize(string)
    @string = string
  end

  def slices(n)
    raise ArgumentError if n > length

    arr = (0..(length - n)).to_a.map do |i|
      chars.slice(i, n).join
    end

    arr.flatten
  end

  def length
    string.length
  end

  def chars
    string.chars
  end

  private
  attr_reader :string
end
