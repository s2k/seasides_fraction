require 'spec_helper'

describe RationalNumber do
  it 'can create a rational Number' do
    expect(subject).to be_a RationalNumber
  end

  it 'can create a number with preset numerator & denominator' do
    n = RationalNumber.new 1, 2
  end
end