class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    new(first_operand, second_operand, operation).calculate
  end

  def initialize(first_operand, second_operand, operation)
    @first_operand = first_operand
    @second_operand = second_operand
    @operation = operation
  end

  def calculate
    begin
      validate!
      print_results

    rescue ZeroDivisionError
      "Division by zero is not allowed."
    end
  end

  private
  attr_reader :first_operand, :second_operand, :operation

  def validate!
    raise ArgumentError unless operand_valid?
    raise UnsupportedOperation unless operation_valid?
  end

  def operand_valid?
    first_operand.is_a?(Integer) && second_operand.is_a?(Integer)
  end

  def operation_valid?
    ALLOWED_OPERATIONS.include?(operation)
  end

  def print_results
    "#{first_operand} #{operation} #{second_operand} = #{sum}"
  end

  def sum
    first_operand.method(operation).(second_operand)
  end

  class UnsupportedOperation < StandardError; end
end
