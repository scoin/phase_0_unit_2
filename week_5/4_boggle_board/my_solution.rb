# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge by myself

boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]


# Part 1: Access multiple elements of a nested array

# Pseudocode

#create_word takes initiated board and splat of coordinates
#iterate over splat of coords, storing each in new mapped array
#join to return string
#

# Initial Solution

 def create_word(board, *coords)
   coords.map { |coord| board[coord.first][coord.last]}.join("")

 end

# Refactored Solution



# DRIVER TESTS GO BELOW THIS LINE
 puts create_word(boggle_board, [2,1], [1,1], [1,2], [0,3])  #=> returns "code"  
 puts create_word(boggle_board, [0,1], [0,2], [1,2])  #=> "rad"

# Reflection 

#this is a simple test of multidimensional array, which works like a graph from top left [0,0] to bottom right [3,3]

#-------------------------------------------------------------------------------

# Part 2: Write a method that takes a row number and returns all the elements in the row.  

# Pseudocode
#get row number and nested array as parameter
#return corresponding nested array


# Initial Solution

def get_row(board, row)
	board[row]
end

# Refactored Solution


# DRIVER TESTS GO BELOW THIS LINE
p get_row(boggle_board,0)
p get_row(boggle_board,1)


# Reflection 

#confusing! There as a google+ discussion on this, where the two most obvious solutions are discussed-
#make get_row take 2 arguments, or make boggle_board a global. Either way, you have to alter the way
#a written function is called - create_word cannot take boggle_board the global as a local, as written
#above. I chose get_row to take 2 args, as this seems most practical. It doesn't hard code global "boggle_board"
#and allows any nested array to be sent as a parameter.


#-------------------------------------------------------------------------------

# Part 3: Now write a method that takes a column number and returns all the elements in the column.

# Pseudocode
#take initiated board and col number as arguments
#iterate over each nested array, storing element[col] in new array
#return new array

# Initial Solution

def get_col(board, col)
	board.map{|array| array[col]}
end

# Refactored Solution


# DRIVER TESTS GO BELOW THIS LINE

p get_col(boggle_board, 0)
p get_col(boggle_board, 1)

# Reflection 

#same issue as above, but sticking to strategy of passing in board. Very simple method of iteration using .map.