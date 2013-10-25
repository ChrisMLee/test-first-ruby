# # # # # # #
# Name of Program: timer
#
# Purpose: Create a timer that can display a given number of seconds in
# seconds, minutes, and hours.
#
# Author: Christopher Lee
#
# Date: 5/27/2013
#
# # # # # # #


class Timer
  attr_accessor :seconds
  def initialize
    @seconds = 0
  end
  
  def time_string
    # needs to be set to gmtime, otherwise time will be off. strftime formats -> %R 24 hr. %S second of minute.
    Time.at(@seconds).gmtime.strftime('%R:%S')
  end

end