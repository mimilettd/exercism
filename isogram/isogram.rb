=begin
Write your code for the 'Isogram' exercise in this file. Make the tests in
`isogram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isogram` directory.
=end

class Isogram
  def self.isogram?(input)
    new(input).isogram?
  end

  def initialize(input)
    @modified_input = input.downcase.gsub(/\W/, '')
    @isogram = true
  end

  attr_reader :modified_input

  def isogram?
    modified_input.chars.inject([]) do |arr, c|
      if arr.include?(c)
        @isogram = false
        break
      else
        arr << c
      end
    end

    @isogram
  end
end
