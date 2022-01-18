=begin
Write your code for the 'Clock' exercise in this file. Make the tests in
`clock_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/clock` directory.
=end

class Clock
  def initialize(hour: 0, minute: 0)
    @hour = hour
    @minute = minute
  end

  def to_s
    "#{pad(modified_hour)}:#{pad(modified_minute)}"
  end

  attr_reader :hour, :minute

  def pad(arg)
    arg.to_s.rjust(2, "0")
  end

  def modified_hour
    m = if minute >= 60
          minute / 60
        else
          0
        end

    r = hour + m

    if r < 24
      r
    elsif r == 24
      0
    elsif minute > 60
      r - 24
    elsif hour > 24
      r / 24
    end
  end

  def modified_minute
    if minute < 60
      minute
    elsif minute == 60
      0
    else
      minute % 60
    end
  end
end
