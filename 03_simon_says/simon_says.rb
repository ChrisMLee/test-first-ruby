# # # # # # #
# Name of Program: simon_says
#
# Purpose: Create a program that produces modified versions of
# string arguments
#
# Author: Christopher Lee
#
# Date: 5/24/2013
#
# # # # # # #

def echo (phrase)
  "#{phrase}"
end

def shout (phrase)
  "#{phrase.upcase}"
end

def repeat (phrase, number = 2)
  ("#{phrase}"+" ") * (number-1) +"#{phrase}"
end


def start_of_word (phrase, letter_pos = 0)
  where = letter_pos.to_i
  phrase.slice(0,where)
end

def first_word(phrase)
  splitted = [ ]
  splitted = phrase.split
  "#{splitted[0]}"
end

def titleize(phrase)
  capital = phrase.gsub(/(\A|\s)\w/){|letter| letter.upcase}
  edited = capital.gsub("And","and").gsub("The","the").gsub("Over","over")
  edited.gsub(/\A\w/){|letter|letter.upcase}
end