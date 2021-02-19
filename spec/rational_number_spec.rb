require 'spec_helper'

describe RationalNumber do
  it { is_expected.to be_a RationalNumber }

  it 'can create real rational numbers' do
    expect(RationalNumber.new(1, 2).numerator).to be 1
    expect(RationalNumber.new(2, 3).denominator).to be 3
    expect(RationalNumber.new(3, 7).numerator).to be 3
    expect(RationalNumber.new(5, 7).denominator).to be 7
  end

  it 'can create improper rationals' do
    expect(RationalNumber.new(11, 13) + RationalNumber.new(7, 11)).to eq RationalNumber.new(212, 143)
  end

  it 'can create a rational using [] notation' do
    expect(RationalNumber[3,5]).to eq RationalNumber.new(3,5)
  end

  it 'can create integer values' do
    expect(RationalNumber.new(7, 7).denominator).to be 1
    expect(RationalNumber.new(-3, 3).numerator).to be(-1)
    expect(RationalNumber.new(1, -1).numerator).to be(-1)
    expect(RationalNumber.new(-1, -1).numerator).to be 1
    expect(RationalNumber.new(-2, -1).numerator).to be 2
  end

  it 'automatically reduces initial values' do
    expect(RationalNumber.new(6, 8)).to eq RationalNumber.new(3, 4)
    expect(RationalNumber.new(6, -8)).to eq RationalNumber.new(-3, 4)
  end

  it 'has a method to create the value zero' do
    expect(RationalNumber.zero).to eq RationalNumber.new(0, 1)
  end

  it 'can add two zeroes' do
    n1 = RationalNumber.zero
    n2 = RationalNumber.zero
    expect(n1 + n2).to eq RationalNumber.zero
  end

  it 'adds two rationals' do
    expect(RationalNumber.new(3, 7) + RationalNumber.new(5, 11)).to eq RationalNumber.new(68, 77)
    expect(RationalNumber.new(-61, 76) + RationalNumber.new(28, 42)).to eq RationalNumber.new(-31, 228)
  end

  it 'returns NaN for an invalid rational number' do
    expect(RationalNumber.new(0, 0)).to eq RationalNumber::NaN
    expect(RationalNumber.new(1, 0)).to eq RationalNumber::NaN
    expect(RationalNumber.new(1.4, 0)).to eq RationalNumber::NaN
  end

  it 'computes the negative of a rational' do
    expect( -RationalNumber.new(7, 29)).to eq RationalNumber.new(-7, 29)
  end

  it 'subtracts to rationals' do
    expect(RationalNumber.new(68, 77) - RationalNumber.new(3, 7)).to eq RationalNumber.new(5, 11)
  end

  it 'inverts a rational number' do
    expect(RationalNumber[3,7].invert).to eq RationalNumber[7,3]
    expect(RationalNumber[11,9].invert).to eq RationalNumber[9,11]
    expect(RationalNumber[11].invert).to eq RationalNumber[1,11]
  end

  it 'yields NaN as the inmverse of 0' do
    expect(RationalNumber[0,1].invert).to eq RationalNumber::NaN
  end

  it 'multiplies rationals' do
    a = RationalNumber[2*19, 7 * 31]
    b = RationalNumber[31 * 5, 7 * 2]
    expect(a * b).to eq RationalNumber[2*19*5*31, 7*31*7*2]
  end

  it 'divides rationals' do
    a = RationalNumber[11,17]
    b = RationalNumber[33,34]
    expect( a / b ).to eq RationalNumber[2,3]
  end

  it 'can tell if it is zero' do
    expect( RationalNumber[0].zero?).to eq true
  end

  it 'returns NaN when dividing by 0' do
    a = RationalNumber[11,17]
    b = RationalNumber[0]
    expect( a / b ).to eq RationalNumber::NaN
  end
end
