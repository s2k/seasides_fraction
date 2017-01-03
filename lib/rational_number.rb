# Provide a simple (simplistic?) implementation of rational numbers
# An example implementation written while working through WBIDD
#
class RationalNumber
  attr_reader :numerator, :denominator

  NaN = new do
    def denominator
      :not_a_number
    end

    def numerator
      :not_a_number
    end
  end

  def self.zero
    new(0, 1)
  end

  def initialize(numerator = 0, denominator = 1)
    return NaN if denominator.zero?
    normalize(denominator, numerator)
  end

  def normalize(denominator, numerator)
    gcd          = numerator.gcd denominator
    @numerator   = numerator / gcd
    @denominator = denominator / gcd
    normalize_sign
  end

  def normalize_sign
    if @denominator < 0
      @denominator = -@denominator
      @numerator   = -@numerator
    end
  end

  def ==(other)
    numerator == other.numerator && denominator == other.denominator
  end

  def +(other)
    gcd = denominator.gcd other.denominator
    self.class.new(numerator * (other.denominator / gcd) + other.numerator * (denominator / gcd), (denominator * other.denominator) / gcd)
  end
end