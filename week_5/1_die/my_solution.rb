# U2.W5: Die Class 1: Numeric


# I worked on this challenge by myself

# 2. Pseudocode

# Input: number of sides
# Output: 
	#sides: number of sides 
	#roll: a random number between 1 and total number of sides
# Steps: 
	#initialize class, make sides a class variable
	#return sides for .sides method
	#return random number between 1 and total sides for roll method


# 3. Initial Solution

class Die
  def initialize(sides)
  	raise ArgumentError.new("Die must exist!") if sides < 1
    @sides = sides
  end
  
  def sides
    @sides
  end
  
  def roll
    rand(1..sides)
  end
end



# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE

mydie = Die.new(6)

p ('1'..'6').include?(mydie.roll.to_s)
p mydie.sides == 6



# 5. Reflection 