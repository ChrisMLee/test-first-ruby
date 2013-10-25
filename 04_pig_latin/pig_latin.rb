# # # # # # #
# Name of Program: pig_latin
#
# Purpose: Create a program that translates strings into 'pig latin'
# by testing whether a word begins with certain arrangements of vowels
# or consonants and modifying the word accordingly
#
# Author: Christopher Lee
#
# Date: 5/25/2013
#
# # # # # # #

# qu_runner handles words that start with a 'qu'
def qu_prefix(word)
  qu_test = /qu/ =~ word
  hack = word.scan(/\w/)
  if qu_test == 0
    hack.delete_at(qu_test)
    hack.delete_at(qu_test)
    present = hack.join("")
    present + "quay"
  else qu_test > 0
    popout = hack[qu_test-1]
    hack << popout
    hack.delete_at(qu_test)
    hack.delete_at(qu_test)
    hack.delete_at(qu_test-1)
    tot_ready = hack.join("")
    tot_ready + "quay"
  end
end
  
# Translates individual words
def word_trans(word) 
  vowel_test = /[aeiou]/ =~ word
  swap = word.scan(/\w/)
  qu_test = /qu/ =~ word
  case
  # Sends words with a 'qu' prefix to qu_prefix
  when qu_test != nil
    qu_prefix(word)
  when vowel_test == 0
    word + "ay"
  when vowel_test == 1
    one_consonant = swap.rotate.join("").to_s
    one_consonant + "ay"
  when vowel_test == 2
    two_consonants = swap.rotate(2).join("").to_s
    two_consonants + "ay"
  else vowel_test == 3
    three_consonants = swap.rotate(3).join("").to_s
    three_consonants + "ay"
  end
end


def translate(phrase)
  chopped = phrase.split
  no_of_words = phrase.split.count
  qu_test = /qu/ =~ phrase
  if no_of_words == 1 
    word_trans(phrase)
  elsif no_of_words > 1
    latinized = chopped.collect {|element| word_trans(element.to_s)}
    latinized.join(" ").to_s
  end
end
