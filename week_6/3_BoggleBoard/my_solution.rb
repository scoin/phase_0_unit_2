# U2.W6: Create a BoggleBoard Class


# I worked on this challenge [by myself, with: ].


# 2. Pseudocode
#Initialize with dice_grid as instance variable
#Alter create_word to use instance variable
#Alter get_row to use instance variable
#Alter get_col to use instance variable
#get_diagonal:
#raise error if same x coordinate or same y coordinate
#create array of strings from board 


# 3. Initial Solution
class BoggleBoard
 
def initialize(dice_grid)
 	@dice_grid = dice_grid
end

def create_word(*coords)
    coords.map { |coord| @dice_grid[coord.first][coord.last]}.join("")

end

def get_row(row)
	@dice_grid[row].join("")
end

def get_col(col)
 	@dice_grid.map{|line| line[col] }.join("")
end

def get_diagonal(start, endpoint)
raise ArgumentError.new("Must be a diagonal") if ((start.first == endpoint.first) || (start.last == endpoint.last)) 

x,y = start.first, start.last
diag = []

loop do
	diag << @dice_grid[x][y]

	x += 1 if endpoint.first > start.first
	x -= 1 if endpoint.first < start.first
	y += 1 if endpoint.last > start.last
	y -= 1 if endpoint.last < start.last

	if x == endpoint.first || y == endpoint.last
		diag << @dice_grid[x][y]
		break
	end
end
diag.join('')
end
end
 
 
dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
boggle_board = BoggleBoard.new(dice_grid)
# 4. Refactored Solution





# 1. DRIVER TESTS GO BELOW THIS LINE
# create driver test code to retrieve a value at a coordinate here:
# implement tests for each of the methods here:
p boggle_board.create_word([1,2], [1,1], [2,1], [3,2])
4.times{|i| p boggle_board.get_row(i)}
4.times{|i| p boggle_board.get_col(i)}
p boggle_board.get_diagonal([0,3], [3,0])

# 5. Reflection 
#This is a fun challenge. It was very easy to translate the code from the previous challenge.
#I struggled a bit with get_diagonal, only because I found the instructions unclear. Should I be 
#returning 4 letters, like the other functions? Or should I be returning any possible diagonal that is entered?
#My function does the latter, and even accounts for user error and does not ever go in straight line. It only returns
#letters that are diagonal from the start point, in any possible direction.
#My code could definitely be refactored and shortened if the expectations are more rigid
#however, if they are as I assumed, which is to get any and all possible diagonals, then I am not sure how to 
#factor more efficiently.