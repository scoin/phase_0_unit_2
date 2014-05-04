# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge by myself

# 2. Pseudocode

# Input: initial input is magic number
		#input function guess "guesses" magic number
# Output: :low, :high, :correct
		 #solved state true or false
# Steps: initalize with class fixnum answer, and class bool solved
		#define guess, which takes a number 
		#compares it to answer
		#returns a symbol notating guess relative to answer
		#define solved which returns class bool solved


# 3. Initial Solution
=begin
class GuessingGame
  def initialize(answer)
    @answer = answer
    @solved = false
  end

  def solved?
   @solved
  end
  
  def guess(num)
  	if num < @answer
  	@solved = false
  	:low 
  	
  elsif num > @answer
  	@solved = false
  	:high
  	
  elsif num == @answer
  	@solved = true
  	:correct 

  end
  end
end
=end



# 4. Refactored Solution

class GuessingGame
  def initialize(answer)
    @answer = answer
  end

  def solved?
   @lastguess == @answer
  end
  
  def guess(num)
    @lastguess = num
    return :low if num < @answer
  
    return :high if num > @answer
    
   return :correct if num == @answer
  end
end



# 1. DRIVER TESTS GO BELOW THIS LINE
game = GuessingGame.new(rand(5..100))

p game.method(:guess).arity == 1
p game.method(:solved?).arity == 0
p game.guess(4) == :low
p game.guess(101) == :high
p game.solved? == false

=begin

game = GuessingGame.new(rand(1..100))
number = 0
while game.solved? == false do
	puts "Make a guess"
	number = gets.chomp().to_i
	game.guess(number)
end
=end

# 5. Reflection 
=begin
This challenge really cemented the use of instance variables for me.
I was unsure about their initialization outside of the initialize 
function. When refactoring, I also implemented the use of a test
in the solved? method, rather than a boolean variable.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  bnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnh

I am unsure why we are returning symbols - maybe just for readability
sake? Why not ints or strings or some other data type?

=end