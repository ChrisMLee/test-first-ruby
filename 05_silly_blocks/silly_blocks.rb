# # # # # # #
# Name of Program: silly_blocks
#
# Purpose: Create a program that modifies the default block,
# either by through reversal, addition, or repetition
#
# Author: Christopher Lee
#
# Date: 5/26/2013
#
# # # # # # #

def reverser
yield.split.map{|word|
  word.reverse}.join(" ")
end


def adder (add = 1)
  num = yield
  num + add
end

def repeater (reps = 1)
  reps.times { yield }
end

