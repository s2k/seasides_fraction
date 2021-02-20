# frozen_string_literal: true

include SeasidesFraction

RSpec.describe SeasidesFraction do

  it { is_expected.to be_a SeasidesFraction }

  it 'has a version number' do
    expect(SeasidesFraction::VERSION).not_to be nil
  end

  it 'can create real rational numbers' do
    expect(Fraction.new(1, 2).numerator).to be 1
    expect(Fraction.new(2, 3).denominator).to be 3
    expect(Fraction.new(3, 7).numerator).to be 3
    expect(Fraction.new(5, 7).denominator).to be 7
  end

  it 'can create improper rationals' do
    expect(Fraction.new(11, 13) + Fraction.new(7, 11)).to eq Fraction.new(212, 143)
  end

  it 'can create a rational using [] notation' do
    expect(Fraction[3, 5]).to eq Fraction.new(3, 5)
  end

  it 'can create integer values' do
    expect(Fraction.new(7, 7).denominator).to be 1
    expect(Fraction.new(-3, 3).numerator).to be(-1)
    expect(Fraction.new(1, -1).numerator).to be(-1)
    expect(Fraction.new(-1, -1).numerator).to be 1
    expect(Fraction.new(-2, -1).numerator).to be 2
  end

  it 'automatically reduces initial values' do
    expect(Fraction.new(6, 8)).to eq Fraction.new(3, 4)
    expect(Fraction.new(6, -8)).to eq Fraction.new(-3, 4)
  end

  it 'has a method to create the value zero' do
    expect(Fraction.zero).to eq Fraction.new(0, 1)
  end

  it 'can add two zeroes' do
    n1 = Fraction.zero
    n2 = Fraction.zero
    expect(n1 + n2).to eq Fraction.zero
  end

  it 'adds two rationals' do
    expect(Fraction.new(3, 7) + Fraction.new(5, 11)).to eq Fraction.new(68, 77)
    expect(Fraction.new(-61, 76) + Fraction.new(28, 42)).to eq Fraction.new(-31, 228)
  end

  it 'returns NaN for an invalid rational number' do
    expect(Fraction.new(0, 0)).to eq Fraction::NAN
    expect(Fraction.new(1, 0)).to eq Fraction::NAN
    expect(Fraction.new(1.4, 0)).to eq Fraction::NAN
  end

  it 'computes the negative of a rational' do
    expect(-Fraction.new(7, 29)).to eq Fraction.new(-7, 29)
  end

  it 'subtracts to rationals' do
    expect(Fraction.new(68, 77) - Fraction.new(3, 7)).to eq Fraction.new(5, 11)
  end

  it 'inverts a rational number' do
    expect(Fraction[3, 7].invert).to eq Fraction[7, 3]
    expect(Fraction[11, 9].invert).to eq Fraction[9, 11]
    expect(Fraction[11].invert).to eq Fraction[1, 11]
  end

  it 'yields NAN as the inverse of 0' do
    expect(Fraction[0, 1].invert).to eq Fraction::NAN
  end

  it 'multiplies rationals' do
    a = Fraction[2 * 19, 7 * 31]
    b = Fraction[31 * 5, 7 * 2]
    expect(a * b).to eq Fraction[2 * 19 * 5 * 31, 7 * 31 * 7 * 2]
  end

  it 'divides rationals' do
    a = Fraction[11, 17]
    b = Fraction[33, 34]
    expect(a / b).to eq Fraction[2, 3]
  end

  it 'can tell if it is zero' do
    expect(Fraction[0].zero?).to eq true
  end

  it 'returns NAN when dividing by 0' do
    a = Fraction[11, 17]
    b = Fraction[0]
    expect(a / b).to eq Fraction::NAN
  end

  it 'displays as a String' do
    expect(Fraction[11, 37].to_s).to eq '11 / 37'
    expect("#{Fraction[11, 37]}").to eq '11 / 37'
  end
end
