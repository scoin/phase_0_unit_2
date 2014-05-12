# U2.W6: Refactoring for Code Readability


# I worked on this challenge by myself


# Original Solution

class CreditCard

def initialize(ccnum)
	raise ArgumentError.new "CC must be 16 Digits" if ccnum.to_s.length != 16 #argument error
	@ccnum = ccnum #makes instance variable of ccnum parameter
end

def check_card
sum = 0 #sum for later when adding all digits

cc_array = @ccnum.to_s.split('').reverse.map.with_index {|d, i| #maps ccnum string to new array
	if i.odd? #if the index is odd
		d.to_i * 2 #multiple the corresponding digit by 2
	elsif i.even? #if it is even
		d.to_i #just place in new mapped array unchanged
	end
}

cc_array.each {|i| #iterate through new array
	if i < 10 #if the number is less than 10
		sum += i #add to sum
	else #if the number is greater than 10
		sum += i.to_s.split('').inject {|both, n| both.to_i + n.to_i} #create a string, split the numbers, sum them, then add to sum
	end
}

return false if sum % 10 != 0 #return false if the sum of the card number algorithm is not evenly divisable by 10
true #return true

end

end


# Refactored Solution

class CreditCard

def initialize(ccnum)
		raise ArgumentError.new "Invalid, must start with 3 - 6" if (!(3..6).include?(ccnum.to_s.split('')[0].to_i)) 
		raise ArgumentError.new "Invalid, not enough digits" if ((4..6).include?(ccnum.to_s.split('')[0].to_i)) && ccnum.to_s.length != 16
		raise ArgumentError.new "Invalid, Amex must be 15 Digits" if (ccnum.to_s.split('')[0] == '3') && ccnum.to_s.length != 15
		@sum = 0

		ccnum.to_s.reverse.split('').each_with_index{|n, i| 
			@sum += (n.to_i * 2).to_s.split('').map(&:to_i).inject(:+) if i.odd?
			@sum += n.to_i if i.even?
		}
end

def check_card
return false if @sum % 10 != 0
true

end
end



# DRIVER TESTS GO BELOW THIS LINE

#err = CreditCard.new(7408041234567893)
#err = CreditCard.new(4408041267893)
#err = CreditCard.new(343841445393274444)


c = CreditCard.new(4408041234567893)
p c.check_card == true

mc = CreditCard.new(5168793266933107)
p mc.check_card == true

discover = CreditCard.new(6011027511360817)
p discover.check_card == true

visa = CreditCard.new(4532311568608749)
p visa.check_card == true

amex = CreditCard.new(343841445393427)
p amex.check_card == true

amex2 = CreditCard.new(378138389522402)
p amex2.check_card == true

fake1 = CreditCard.new(4408041234567892)
p fake1.check_card == false

fake2 = CreditCard.new(4402041239565892)
p fake2.check_card == false

fake3 = CreditCard.new(378438389222002)
p fake3.check_card == false

# Reflection 
# I was happy to refactor my own code. I took a look at it and decided it could be more concise and more readable.
#I believe I have accomplished that here. Instead of two iterations and two arrays being created, there is
#now 0 arrays created and one iteration that performs the entire algorithm. The code is only 7 lines, not 
#including declarations or argument errors. The argument errors as written will only allow card numbers to
#start with 3,4,5,6, and must have appropriate amount of numbers, (15 if starting with 3, 16 if 4,5,6)
#It works for all cards, including Amex.