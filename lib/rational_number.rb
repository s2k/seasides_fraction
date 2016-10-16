class RationalNumber
  attr_reader :numerator, :denominator

  def self.zero
    new(0,1)
  end

  def initialize(numerator = 0, denominator = 1)
    gcd = numerator.gcd denominator
    @numerator   = numerator / gcd
    @denominator = denominator / gcd
  end

  def ==(other)
    numerator == other.numerator && denominator == other.denominator
  end

  def +(other)
    gcd = denominator.gcd other.denominator
    self.class.new(numerator * (other.denominator / gcd) + other.numerator * (denominator / gcd), (denominator * other.denominator) / gcd)
  end
end