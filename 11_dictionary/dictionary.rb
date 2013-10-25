# # # # # # #
# Name of Program: dictionary
#
# Purpose: Create a dictionary class that allows one to add entries,
# search entries, and produce printable output.
#
# Author: Christopher Lee
#
# Date: 5/31/2013
#
# # # # # # #

class Dictionary
  attr_accessor :entries, :keywords, :find
  def initialize (entries = {}, keywords = Array.new, find = {})
    @entries = entries
    @keywords = keywords
    @find = find
  end
  
  def add (input)
    if input.kind_of?(Hash)
      entries.merge!input
      keywords.concat(entries.keys)
      @keywords = keywords.uniq.sort
    else input.kind_of?(String)
      keywords<<input
      @keywords = keywords.uniq.sort
      entries[(input)]= nil
    end
  end

  def include? (input)
    keywords.include?(input)
  end

  def printable
    total_hash = Hash[@keywords.zip(@entries.values_at *@keywords)]
    ready = total_hash.collect{|k,v|  "[#{k}] \"#{v}\"\n"}.join
    ready.chomp("\n")
  end


  def find (input)
    # Formats keywords into a searchable string
    keys_string = @keywords.uniq.join(" ")
    # Turns 'input', the search term, into a searchable regular expression
    ready_string = "(\\s|" + input + "\\w\+\)"
    ready_regex = Regexp.new (ready_string)
    # Searches keywords for regular expression
    search_keys = keys_string.scan(ready_regex).join(" ").split
    # Takes the found entries(keys) and associates them with their corresponding
    #  values
    found_entries = Hash[search_keys.zip(@entries.values_at *search_keys)]
    if search_keys.empty? == false
      found_entries
    elsif keywords.include? input == true
      @keywords
    elsif entries.has_key?(input)
      @entries
    else
      @find
    end
  end

end


