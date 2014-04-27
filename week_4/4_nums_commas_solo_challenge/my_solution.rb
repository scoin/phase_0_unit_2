# U2.W4: Numbers to Commas Solo Challenge

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  


# 1. Pseudocode

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?

#the input is a fixnum
#the output is a string separated appropriately with commas

#define the function that gets the integer
#use log10 and set conditonals - 
#if log10 of int is < 3, no comma
#if >=3 & <4, comma in the second place ie 3,000
#if >=4 & <5, comma in the third place ie 30,000
#if >=5 & <6, fourth place ie. 300,000
#if >=6 & <7, second and sixth place ie. 3,000,000
#if >=7 & <8, third and seventh place ie. 30,000,000
#if >=8 & <9, fourth and eigth ie. 300,000,000
#return string

# 2. Initial Solution
=begin
def separate_comma(num)
	is_neg, num = true, num.abs if num < 0
	snum = num.to_s.split('')
	snum.insert(1, ',') if ((Math.log10(num) >= 3 && Math.log10(num) < 4)) || ((Math.log10(num) >= 6) && (Math.log10(num) <= 7))
	snum.insert(2, ',') if ((Math.log10(num) >= 4 && Math.log10(num) < 5)) || ((Math.log10(num) >= 7) && (Math.log10(num) <= 8))
	snum.insert(3, ',') if ((Math.log10(num) >= 5 && Math.log10(num) < 6)) || ((Math.log10(num) >= 8) && (Math.log10(num) <= 9))
	snum.insert(5, ',') if ((Math.log10(num) >= 6) && (Math.log10(num) <= 7))
	snum.insert(6, ',') if ((Math.log10(num) >= 7) && (Math.log10(num) <= 8))
	snum.insert(7, ',') if ((Math.log10(num) >= 8) && (Math.log10(num) <= 9))
	snum.unshift('-') if is_neg == true
	snum.join
end
=end

# 3. Refactored Solution
def separate_comma(num)
	is_neg, num = true, num.abs if num < 0

	snum = num.to_s.split('')
	snum.insert(snum.length - 3, ',') if snum.length >= 4
	snum.insert(snum.length - 7, ',') if snum.length >= 8
	snum.unshift('-') if is_neg == true

snum.join

end

# 4. Reflection 
=begin

My initial challenge here was myself. For some reason I did not make the connection that .length could easily solve this problem after conversion
to a string - I had it in my mind to do mathematical operation. In any case, I refactored and the program runs faster on less lines and conditions.

In both cases, I also wanted to allow the program to work with negative numbers, as the instructions did not say "a positive integer" as they
commonly do.

This task further cemented string operations for me, as well as taught me the likely very important array method Array#insert. 

	
=end