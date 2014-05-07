# U2.W6: Testing Assert Statements

# I worked on this challenge by myself


# 2. Review the simple assert statement
=begin
def assert
  raise "Assertion failed!" unless yield
end

name = "bettysue"
assert { name == "bettysue" }
assert { name == "billybob" }
=end
# 2. Pseudocode what happens when the code above runs

#function assert declared
#raises an error unless yielded block is truthy
#sets name
#function assert called, sends block

# 3. Copy your selected challenge here

class RPNCalculator
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


# 4. Convert your driver test code from that challenge into Assert Statements

def assert
  raise "Assertion failed!" unless yield
end

rpn = RPNCalculator.new

assert { rpn.evaluate('0') == 0 }
assert { rpn.evaluate('-1') == -1 }
assert { rpn.evaluate('1 1 +') == (1 + 1) }
assert { rpn.evaluate('1 -1 +') == 0 }
assert { rpn.evaluate('2 2 *') == (2 * 2) }
assert { rpn.evaluate('5 10 -') == (5 - 10) }
assert { rpn.evaluate('1 2 3 4 + + +') == (1 + 2 + 3 + 4) }
assert { rpn.evaluate('1 2 + 3 4 + *') == ((2 + 1) * (4 + 3)) }
assert { rpn.evaluate('20 10 5 4 + * -') == (20 - 10*(5 + 4)) }

# 5. Reflection
#Assert is a very powerful form of testing. I understood yield before this, and it is very powerful
#to be able to send a block to function of your own design.
#This did not really pose a challenge, it was very easy to port the rspec code to 
#assert statements. 
#One thing I don't totally understand is how the yielded block, run inside assert, knows
#the value of name in the example. What is the scope of a variable when sent into assert?