# # # # # # #
# Name of Program: calculator
#
# Purpose: Create a calculator that can take to parameters
# and add them, subtract them as well as add all of the contents
# of an array together.
#
# Author: Christopher Lee
#
# Date: 5/24/2013
#
# # # # # # #

def add(number_1, number_2)
  number_1 + number_2
end

def subtract(number_1, number_2)
  number_1 - number_2
end

def sum(randomarray)
  index = 0
  my_sum = 0
  result = Array.new

  while index < randomarray.count
    randomarray[index] + my_sum
    my_sum = randomarray[index] + my_sum
    index += 1
  end
  my_sum
end


def multiply (*numbers)
  numbers.inject {|result,element| result * element}
end

def power(number_1, number_2)
  number_1**number_2
end

def factorial(number)
  facts = Array.new
  i = 1
  if number == 0
    return 1
  end
  while i <= number
    facts << i
    i += 1
  end
  facts.inject {|result,element| result * element}
end


 
      