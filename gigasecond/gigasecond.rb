=begin
Write your code for the 'Gigasecond' exercise in this file. Make the tests in
`gigasecond_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/gigasecond` directory.
=end

class Gigasecond
  GIGASECOND = 1000000000

  def self.from(time)
    new(time).from
  end

  def initialize(time)
    @time = time
  end

  def from
    Time.at(total).utc
  end

  def total
    time.to_i + GIGASECOND
  end

  private
  attr_reader :time
end
