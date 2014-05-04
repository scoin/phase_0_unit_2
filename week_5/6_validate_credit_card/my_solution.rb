# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: a credit card number
# Output: true or false depending if cc holds to algorithm
# Steps:
#initialize with cc number
#throw error if not 16 digits (should be 15 also for AMEX, feature to be added)
#map cc num to array from reverse, multiplying odd indexed numbers * 2 and leaving
#even indexed numbers unaltered
#Sum the mapped array, splitting digits over 9 and summing them
#Check is total sum % 10 is 0


# 3. Initial Solution

# Don't forget to check on intialization for a card length
# of exactly 16 digits
class CreditCard

def initialize(ccnum)
	raise ArgumentError.new "CC must be 16 Digits" if ccnum.to_s.length != 16
	@ccnum = ccnum
end

def check_card
sum = 0

cc_array = @ccnum.to_s.split('').reverse.map.with_index {|d, i| 
	if i.odd?
		d.to_i * 2 
	elsif i.even? 
		d.to_i 
	end
}.reverse! # doesn't need to be here, but I feel like I want it in the right order even though we're just summing it

cc_array.each {|i| 
	if i < 10 
		sum += i
	else
		sum += i.to_s.split('').inject {|both, n| both.to_i + n.to_i}
	end
}

return false if sum % 10 != 0
true

end

end



# 4. Refactored Solution

#I'm going to take a second look at it in a day, but immediately following writing it I cannot find a place
#to refactor that makes it simpler or more readable.




# 1. DRIVER TESTS GO BELOW THIS LINE

c = CreditCard.new(4408041234567893)

p c.check_card == true

p c.method(:check_card).arity == 0

d = CreditCard.new(4408041234567892)

p d.check_card == false

# 5. Reflection 
# This is a fun program. I wrote this in C about 3 months ago and for that reason found it really easy.
# Ruby is certainly much easier and more intuitive than C. I would like to add features that check what
# kind of card it is, and if its valid based on the card types requirements (ie Amex must start with 34, 37, or 39.)
