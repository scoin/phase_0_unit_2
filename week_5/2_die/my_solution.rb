# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: an array of strings
# Output: sides: number of possible outcomes
		#roll: a random string from the input array
# Steps: initialize die, set class variable labels
#raise argument error if input array is empty
#sides: array size
#roll: sample from array, use join to return string as per rspec


# 3. Initial Solution

class Die
  def initialize(labels)
  	raise ArgumentError.new if labels.empty?
  	@labels = labels
  end

  def sides
  	@labels.size
  end

  def roll
  	@labels.sample(1).join()
  end
end



# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE

mydie = Die.new(['A','B','C','D','E','F'])

p mydie.method(:roll).arity == 0
p mydie.sides == 6
p ['A','B','C','D','E','F'].include?(mydie.roll)



# 5. Reflection 
