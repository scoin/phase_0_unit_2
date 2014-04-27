# U2.W4: Pad an Array

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  


# 1. Pseudocode

# What is the input? 
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?

#The input is an array and an optional default value to pad with
#The output is the same array, padded if the size reqs are met
# for pad - create a duplicate array
# check the size differential - variable pad size - array.le gth
#push the optional variable to the array enough times to satisfy and return

# 2. Initial Solution
=begin
class Array
		def pad(total, x = nil)
		array = self.dup
		(total - array.size).times do array << x end if total > array.size
			array
	end
	def pad!(total, x = nil)
		(total - self.size).times do self.push(x) end if total > self.size
			self
	end
end
=end
# 3. Refactored Solution

class Array
	def pad!(total, x = nil)
		self.fill(x, self.size, (total - self.size)) if total > self.size
		self
	end
		def pad(total, x = nil)
		self.dup.pad!(total, x)
	end
	
end

# 4. Reflection 
=begin
	
	This was great. I had seen and understood class extensions, but I hadn't actually done it with anything meaningful. To make a new method 
	feels really powerful. At first I thought I needed to iterate through the array, and then I learned Array#fill in refactoring.

	I found this problem simple in conception, but of course there was a better way than my initial idea. 

	I'm also not sure if just using self is destructive - I feel like it is based on the supplied rSpec, as it does it by unique ID. Of course 
	all the tests pass with both solutions above.

	

=end