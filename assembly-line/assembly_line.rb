class AssemblyLine
  OUTPUT_RATE = 221.0

  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    @speed * OUTPUT_RATE * success_rate
  end

  def success_rate
    if (1..4).include?(@speed)
      1
    elsif (5..8).include?(@speed)
      0.90
    elsif @speed == 9
      0.80
    elsif @speed == 10
      0.77
    end
  end

  def working_items_per_minute
    production_rate_per_hour.to_i / 60
  end
end
