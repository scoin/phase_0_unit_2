# U2.W4: SOLO CHALLENGE Calculate the Median!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge by myself.

# 1. Pseudocode

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?

# For the median, we are inputting an array of fixnums
# The output will return the median fixnum
# Sort the array
# If array size is odd, return the median number
# If array size is even, return the average of the two median numbers

# 2. Initial Solution

def median(array)
	array.sort!
	return array[(array.size / 2)] if array.size.odd?
	return (array[(array.size / 2) - 1] + array[array.size / 2]) / 2.0
end

# 3. Refactored Solution
# I do not believe that this solution can be refactored.


# 4. Reflection 
=begin 
We've done median and mode alot between the intro work, javascript, codecademy, etc. It is a simple math operation that I believe I have done as
simply as possible here, as ruby provides us a sort.

I do not find it a challenge, but I find the requested process - the psuedo code, and thinking about refactoring, etc  - to be great 
	practice.

=end