require 'spec_helper'

describe RationalNumber do
  it { is_expected.to be_a RationalNumber }

  it 'can create a number with preset numerator & denominator' do
    expect(RationalNumber.new(1, 2).numerator).to be 1
    expect(RationalNumber.new(2, 3).denominator).to be 3
    expect(RationalNumber.new(3, 7).numerator).to be 3
    expect(RationalNumber.new(5, 7).denominator).to be 7
  end

  it 'automatically reduces initial values' do
    expect(RationalNumber.new(6,8)). to eq RationalNumber.new(3,4)
  end

  it 'has a method to create the value zero' do
    expect(RationalNumber.zero).to eq RationalNumber.new(0,1)
  end

  it 'can add two zeroes' do
    n1 = RationalNumber.zero
    n2 = RationalNumber.zero
    expect(n1 + n2).to eq RationalNumber.zero
  end

  it 'adds two rationals' do
    expect(RationalNumber.new(3,7) + RationalNumber.new(5,11)).to eq RationalNumber.new(68,77)
  end
end