# U2.W4: Calculate the mode!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge by myself

# 1. Pseudocode

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?

#Take array of variables and find mode
#Output array of mode(s) 
#Iterate through array
#use .count method to calculate frequency of variable
#store variables with highest frequency in array
#return array

# 2. Initial Solution
=begin
def mode(array)

histo = Hash.new(0)
freq_array = []

array.each do |x|
histo[x] = array.count(x)
end

histo.each_pair { |key, val|  
freq_array << key if val == histo.values.max
}
freq_array
end
=end
# 3. Refactored Solution

def mode(array)
	freqs, keys = [], []
	array.each do |x| freqs << array.count(x) end
	array.uniq.each do |y| keys << y if array.count(y) == freqs.max end
	keys
end

# 4. Reflection 
=begin 
Initially I build a hash histogram, and I realized I could accomplish the same process using Array#max without using a hash. There still may be 
a more efficient and faster way to do this.

I feel we have done mode and median to death between the intro work, javascript, this and other stuff like codecademy - so I do not find the
	basic process to be challenging. However, to make it as elegant as possible definitely is, and I'm not sure that's what I've done here.



=end