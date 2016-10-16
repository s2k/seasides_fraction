require 'spec_helper'

describe RationalNumber do
  it 'can create a rational Number' do
    expect(subject).to be_a RationalNumber
  end

  it 'can create a number with preset numerator & denominator' do
    expect(RationalNumber.new(1, 2).numerator).to be 1
    expect(RationalNumber.new(2, 3).denominator).to be 3
    expect(RationalNumber.new(3, 7).numerator).to be 3
    expect(RationalNumber.new(5, 7).denominator).to be 7
  end
end