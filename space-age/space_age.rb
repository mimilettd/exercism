=begin
Write your code for the 'Space Age' exercise in this file. Make the tests in
`space_age_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/space-age` directory.
=end

class SpaceAge
  EARTH_YEAR_IN_SECONDS = 31557600

  def initialize(seconds)
    @seconds = seconds
  end

  def on_earth
    calculate(1.0)
  end

  def on_mercury
    calculate(0.2408467)
  end

  def on_venus
    calculate(0.61519726)
  end

  def on_mars
    calculate(1.8808158)
  end

  def on_jupiter
    calculate(11.862615)
  end

  def on_saturn
    calculate(29.447498)
  end

  def on_uranus
    calculate(84.016846)
  end

  def on_neptune
    calculate(164.79132)
  end

  private
  attr_reader :seconds

  def calculate(orbital_period)
    (seconds / (EARTH_YEAR_IN_SECONDS * orbital_period)).round(2)
  end
end
