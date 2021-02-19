##  A simple class modeling rational numbers in Ruby

Yes, this class isn't necessary, because there already *is* `Rational` in Ruby which does exactly this.

However, _this_ code is created while working through J.B Rainsberger's [The World's Best Intro to TDD (WBITDD)](http://www.jbrains.ca/training/the-worlds-best-introduction-to-test-driven-development/).


## How to Use

* Don't. Use Ruby's `Rational`class instead.
* If you also work through WBITTD, I suggest you write _your_ implementation first and then look at my work.
* If you want to use _this_ code anway:
  * Put `lib/rational_number.rb` where your Ruby installation can find it when it's `require`d.
  * Then `require 'rational_number'` … and use the class `RationalNumber`.
