# # # # # # #
# Name of Program: book
#
# Purpose: Create a 'Book' class with a 'title' method that can
# capitalize book titles according to certain parameters
#
# Author: Christopher Lee
#
# Date: 5/27/2013
#
# # # # # # #

class Book
  attr_accessor :title
  def initialize
    @title = title
  end
  
  def title
    articles = ['a','an','and','the','in','of']
    # Capitalizes all words except those belonging to 'articles'
    result = @title.to_s.split(" ").each{|i|i.capitalize! if ! articles.include? i}.join(' ')
    # Capitalizes the first word regardless of its type
    result.sub(/\A\w/){|letter|letter.upcase}
  end
  
end
