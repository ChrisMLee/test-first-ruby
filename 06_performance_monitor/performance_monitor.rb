# # # # # # #
# Name of Program: performance_monitor
#
# Purpose: Create a program runs a block of code and then 
# tells you how long it took to run
#
# Author: Christopher Lee
#
# Date: 5/26/2013
#
# # # # # # #

def measure(number_of_times=0)
  if number_of_times > 0 
    start = Time.now
    number_of_times.times { yield }
    elapsed_time = Time.now-start
    average_time = elapsed_time/number_of_times
  else
    start = Time.now
    yield 
    elapsed_time=Time.now-start
  end
end
