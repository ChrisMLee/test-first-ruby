# # # # # # #
# Name of Program: rpn_calculator
#
# Purpose: Create a calculator class that can evaluate mathematical
# problems written in Reverse Polish Notation.
#
# Author: Christopher Lee
#
# Date: 6/05/2013
#
# # # # # # #

class RPNCalculator
  attr_accessor :calculator
  def initialize (calculator = calculator, values = [])
    @calculator = calculator
    @stack = values
  end
  
  def push (input)
    @stack.push(input)
  end

  # Method to invoke 'value' methods.
  def method_caller(input)
    send conditions[input]
  end
  
  # Keys to call these methods
  def conditions()
    {:+ => :plus, :- => :minus, :/ => :divide, :* => :times}
  end

  # 1) Selects last two pieces of array and 2) adds them together
  #  and 3) puts them back into the stack. 4) stack now contains only the final result
  def plus
    if @stack == []
      raise ArgumentError, "calculator is empty"
    else
      last_two = @stack.last(2)
      @stack = @stack[0..-3]
      # map(&:to_i)
      plus_result = last_two.inject(:+)
      @stack << plus_result
      @stack
    end
  end

  def minus
    if @stack == []
      raise ArgumentError, "calculator is empty"
    elsif
      @stack.count == 2
      # Gets numbers two in from end of array
      minus_result = @stack[-2]-@stack[-1]
      @stack = @stack.clear
      @stack << minus_result
      # Minus the second number from the first number
    else @stack.count > 2
      minus_result = @stack[-2]-@stack[-1]
      # Takes the last two off of the stack
      @stack = @stack[0..-3]
      @stack << minus_result
    end
  end

  def divide
    if @stack == []
      raise ArgumentError, "calculator is empty"
    elsif @stack.count == 2
      divide_result = @stack[-2].to_f / @stack[-1].to_f
      @stack = @stack.clear
      @stack << divide_result
    else @stack.count > 2
      divide_result = @stack[-2].to_f / @stack[-1].to_f
      @stack = @stack[0..-3]
      @stack << divide_result
    end
  end

  def times
    if @stack == []
      raise ArgumentError, "calculator is empty"
    elsif @stack.count == 2
      # Gets numbers two in from end of array
      times_result = @stack[-2].to_f * @stack[-1].to_f
      @stack = @stack.clear
      @stack << times_result
    else @stack.count > 2
      times_result = @stack[-2].to_f * @stack[-1].to_f
      @stack = @stack[0..-3]
      @stack << times_result
    end
  end


  def value
    if @stack.count == 1
      @stack[0]
    else @stack.count > 1
      @stack[1]
    end
  end

  def tokens(input)
    input.split.map!{|x|x[/\d/] ? x.to_i : x.to_sym }
  end

  def evaluate (input)
    # Clears the stack for multiple operations
    @stack = []
    i = 0
    ready_toke = tokens(input)
    # Loops through, fills stack, runs method, repeat
    while i < ready_toke.count
      current_item = ready_toke[i]
      if current_item.is_a? Integer
        @stack << current_item
      else current_item.is_a? Symbol
        # Only calls the method on the current instance
        self.method_caller(current_item)
      end
      i += 1
    end
    self.value
  end

end
