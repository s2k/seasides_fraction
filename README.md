# SeasidesFraction

##  A simple class modeling rational numbers in Ruby

This class isn't necessary, because there already *is* `Rational` in Ruby which you should use instead of this one.
However, _this_ code is created while working through J.B Rainsberger's [The World's Best Intro to TDD (WBITDD)](http://www.jbrains.ca/training/the-worlds-best-introduction-to-test-driven-development/).


**WARNING**: I mean it — Use Ruby's `Rational` class instead.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'seasides_fraction'
```

And then execute:

```
> bundle
```

Or install it yourself as:

```
> gem install seasides_fraction
```

## Usage

In your code `require 'seasides_rational` to load the gem and then either use the class  `SeasidesRational::RationalNumber`or `include  SeasidesRational` and use class `RationalNumber` without having to type the full name all the time.

An example from an `irb` session:

```
> irb -r seasides_rational
3.0.0 :001 > SeasidesRational::Fraction[2,3] + SeasidesRational::Fraction[7,11]
 => #<SeasidesRational::Fraction:0x00007ffb3385b138 @denominator=33, @numerator=43>
3.0.0 :002 > include SeasidesRational
 => Object
3.0.0 :003 > sum = Fraction[7,22] + Fraction[33,21]
 => #<SeasidesRational::Fraction:0x00007ffb33a24320 @denominator=154, @numerator=291>
3.0.0 :004 > sum.to_s
 => "291 / 154"
 ```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/s2k/seasides_rational. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SeasidesRational project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/s2k/seasides_rational/blob/master/CODE_OF_CONDUCT.md).
