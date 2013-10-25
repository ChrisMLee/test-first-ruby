# # # # # # #
# Name of Program: temperature
#
# Purpose: Converts fahrenheit temperatures to celsius and vice versa
#
# Author: Christopher Lee
#
# Date: 5/24/2013
#
# # # # # # #

def ftoc (fahrenheit)
  (fahrenheit-32.0) * 5.0/9.0
end

def ctof (celsius)
  (celsius * 9.0/5) + 32
end