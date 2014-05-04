# U2.W5: Implement a Reverse Polish Notation Calculator


# I worked on this challenge by myself

# 2. Pseudocode

# Input: a string containing RPN
# Output: a fixnum
# Steps:
#get equation in RPN
#split the string into an array
#loop through the array, checking for operator ie '+'
#sum the two numbers at the two previous indices
#decrement the index and continue iterating

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
=begin 
This is a great challenge. I used a while loop to iterate through the array because
I wanted to keep the work inside the array, which is representative of the equation.
I felt like this was the easiest way, but in turn I was unable to use a proper 
iterator like each or map because I need the index to decrement.

While I stuck to the guidelines in this challenge, this is not something that
required a class declaration. All the calculation takes place in one method -
though I suppose I could add some extra features.

While I don't see any room to refactor, it seems silly that I have to use conditionals
for each operator - I know there is "code to write code" in ruby, and I feel like
I could use the string "+" for example as an operator itself. That is how I would 
refactor it, but at this time that is beyond my knowledge.
=end