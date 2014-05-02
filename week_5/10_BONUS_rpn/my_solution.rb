# U2.W5: Implement a Reverse Polish Notation Calculator


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: a string containing RPN
# Output: a fixnum
# Steps:


# 3. Initial Solution

class RPNCalculator
  	def initialize
  		#raise ArgumentError.new "must be string" if !equation.is_a?(String)
  		#raise ArgumentError.new "must contain atleast 2 numbers and operand" if !equation.include?(/'+-*'/) && !equation.include?(0..9)
	end

	def evaluate(equation)
		work = equation.split(' ')
		i = 0
		while i < work.length do
			if "+-*".include?(work[i])
				work[i] = work[i - 2].to_i + work[i-1].to_i if work[i] == '+'
				work[i] = work[i - 2].to_i - work[i-1].to_i if work[i] == '-'
				work[i] = work[i - 2].to_i * work[i-1].to_i if work[i] == '*'
				2.times do work.delete_at(i-2) end
				i -= 2
			end
			i+= 1
		end
		work[0].to_i
	end


	end


# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE


# 5. Reflection 
