=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end

class Matrix
  def initialize(input)
    @input = input
  end

  def rows
    input.split("\n").map do |s|
      s.split.map(&:to_i)
    end
  end

  def columns
    matrix_flipped = []

    rows[0].length.times do |i|
      column = []
      rows.length.times do |j|
        column << rows[j][i]
      end
      matrix_flipped << column
    end

    matrix_flipped
  end

  private

  attr_reader :input
end
