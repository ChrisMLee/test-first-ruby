# # # # # # #
# Name of Program: temperature
#
# Purpose: Create a class with instance methods that can convert
# celsius to fahrenheit and vice versa. Class should include class methods
# that can be defined on the class.
#
# Author: Christopher Lee
#
# Date: 5/26/2013
#
# # # # # # #


class Temperature
  attr_accessor :f, :c
  def initialize (params = {})
    @f = params[:f]||nil
    @c = params[:c]||nil
  end

  def in_celsius
    if @f
      conversion_one = (@f -32.0)*5.0/9.0
      conversion_one.round
    else
      @c
    end
  end
    
  def in_fahrenheit
    if @f != nil
      @f
    else @c !=nil
      (@c * 9.0/5) + 32
    end
  end

  def self.from_celsius (input)
    self.new(:c => input)
  end

  def self.from_fahrenheit(input)
    self.new(:f => input)
  end

end

class Celsius < Temperature
  def initialize (input, gainparams = {})
    @c = input
  end
end

class Fahrenheit < Temperature
  def initialize (input, gainparams = {})
    @f = input
  end
end

