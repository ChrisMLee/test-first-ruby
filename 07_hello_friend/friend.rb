# # # # # # #
# Name of Program: hello_friend
#
# Purpose: Create a 'Friend' class complete with a method to
# respond with a generic greeting if no argument is given and
# a customized greeting if an argument is given
#
# Author: Christopher Lee
#
# Date: 5/26/2013
#
# # # # # # #


class Friend
  def greeting(who = nil)
    if who != nil
      "Hello," + " #{who}!"
    else
      "Hello!"
    end
  end
end
