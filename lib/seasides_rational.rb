# frozen_string_literal: true

require 'seasides_rational/version'

module SeasidesRational
  class RationalNumber
    attr_reader :numerator, :denominator

    NAN = new do
      def numerator
        :not_a_number
      end

      def denominator
        :not_a_number
      end
    end

    def self.zero
      new(0, 1)
    end

    def self.[](numerator = 0, denominator = 1)
      new(numerator, denominator)
    end

    def initialize(numerator = 0, denominator = 1)
      if denominator.zero?
        @nominator = @denominator = NAN.numerator, NAN.denominator
      else
        normalize(denominator, numerator)
      end
    end

    def normalize(denominator, numerator)
      gcd          = numerator.gcd denominator
      @numerator   = numerator / gcd
      @denominator = denominator / gcd
      normalize_sign
    end

    def normalize_sign
      return unless @denominator.negative?
      @denominator = -@denominator
      @numerator   = -@numerator
    end

    def ==(other)
      numerator == other.numerator && denominator == other.denominator
    end

    def zero?
      self == self.class.zero
    end

    def -@
      self.class.new(-numerator, denominator)
    end

    def +(other)
      gcd = denominator.gcd other.denominator
      self.class.new(numerator * (other.denominator / gcd) + other.numerator * (denominator / gcd), (denominator * other.denominator) / gcd)
    end

    def -(other)
      self + -other
    end

    def invert
      self.class.new(denominator, numerator)
    end

    def *(other)
      self.class[numerator * other.numerator, denominator * other.denominator]
    end

    def /(other)
      return NAN if other.zero?
      self * other.invert
    end
  end
end
