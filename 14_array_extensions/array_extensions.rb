# # # # # # #
# Name of Program: array_extensions
#
# Purpose: Create an 'Array' class with methods to add array contents,
# square array contents, and square array contents in place.
#
# Author: Christopher Lee
#
# Date: 6/10/2013
#
# # # # # # #

class Array
  attr_accessor :define_array
  def intialize (define_array = [])
    @define_array = []
  end
  
  def sum
    if self == []
      0
    else
      self.inject(:+)
    end
  end

  def square
    if self == []
      self
    else
      self.map {|num| num ** 2}
    end
  end

  # Destructively squares original array
  def square!
    if self == []
      self
    else
      self.map! {|num| num ** 2}
    end
  end
  
end