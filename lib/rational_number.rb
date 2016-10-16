class RationalNumber
  attr_reader :numerator, :denominator

  def initialize(numerator = 0, denominator = 0)
    @numerator   = numerator
    @denominator = denominator
  end
end