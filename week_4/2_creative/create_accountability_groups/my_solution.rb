# U2.W4: Create Accountability Groups


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: An array of names of all students in the cohort. I copied (as in ctrl-c) the socrates page, pasted plaintext into a string.
# I wrote a separate small program to turn all the names into an array. 
# Output: The output will be an array of arrays, containing the students in groups of 4, or as close to it as possible.
# Steps: 
# Take the input array 
# Use .sample to take a sample of 4 if modulus 4 == 0, otherwise take sample of 5
# Delete the 4 taken and resample the array of names
# return array of groups

students = ["Adrian Soghoian", "Ajay BirSingh", "Alec Ashford", "Alex Mazur", "Alexis Ernst", "Amelia Downs", "Amol Borcar", "Andres Meneses", "Andrew C.KoinesJr.", "Andrew Principe", "Antonio Perez", "Armen Vartan", "Austin Bourdier", "Ben Brostoff", "Brendan Susens-Jackson", "Brennon Williams", "Bridgette L.Salcido", "Britney VanValkenburg", "Celeen Rusk", "Chad EverettHoward", "Christian Moon", "Colin Trent", "Dakota Cousineau", "Danny Glover", "Gabriel Garrett", "Gregory Piccolo", "Gregory White", "Hing Huynh", "Ian Shuff", "Jake Wayne", "Jeff Kynaston", "Jennifer Oseitutu", "Jeuel Wilkerson", "John-Thomas Mulvahill", "Joseph Rosztoczy", "Josh Jeong", "Katie Reiner", "Kendall Carey", "Kenneth Mendonca", "Kirstin Jarchow", "Kris Shanks", "Lienha Carleton", "Martin A.Lear", "Matias Andres", "Matthew Hein", "Matthew Kuzio", "Matthieu Gavaudan", "Meneses Matias", "Michael Drew-Teter", "Michael Ginalick", "Neel Shah", "Nick Giovacchini", "Osama Zayyad", "Phillip Crawford", "Phillip Smith", "Rj Bernaldo", "Ronald Ishak", "Ryan Stack", "Scott Jason", "Sherwood Callaway", "Siddharth Patel", "Simon Gondeck", "Spencer Olson", "Stella Kim", "Stuart Pearlman", "Timoor Kurdi", "Timothy Howard", "Valentine Sverdlov", "Vivek MGeorge", "Yariv Kirschner", "Zach Pflederer"]
#had to delete first entry "Adam Hardy" so I could get a size not divisible by 4. Sorry Adam!

# 3. Initial Solution

def accountability_groups(students)

throwaway = []
unit = []
groups = []

3.times do
	throwaway = students.dup
	i = 0

	while(throwaway.size > 0) do

		unit << throwaway.sample(4) if throwaway.size % 4 == 0 
		unit << throwaway.sample(5) if throwaway.size % 4 != 0
		unit[i].each { |student| throwaway.delete(student) }
		i += 1
	end

	groups << unit.dup
	unit.clear
end
groups
end

#I also wrote a separate function to cleanly print the groups 

def print_groups(groups)
	x = 0
	3.times do
	puts "Unit #{x + 1} Groups"
	groups[x].each { |group| puts "#{group} \n" }
	x += 1
end
end
# 4. Refactored Solution
#I could rewrite my entire code to function differently, but as it stands, I do not believe I can make it more efficient.
#I chose to use .sample, and as such it has to function this way to make three different sets of groups (units) using the same
#list of students. It feels inefficient to move the names from the main array (students) to another (throwaway) to another (unit) 
#and then ultimately to its final location (groups) but throwaway and unit both end up completely empty. The returning multi
#-dimensional array, groups, ends up nice and organized.


# 1. DRIVER TESTS GO BELOW THIS LINE

p accountability_groups(students) != accountability_groups(students) #different results?

answer = accountability_groups(students)
p answer.flatten.include?("Gregory Piccolo") #i'm there
p answer[0][0].size == 5 #Groups are made of 5 until number of remaining students is divisable by 4

print_groups(answer)


# 5. Reflection 
#I find these open ended challenges really hard! I feel like with clear cut guidelines I would have a better starting direction,
#though I suppose that is part of the challenge. 
#My biggest challenge was definitely that - deciding where to go and what features to implement. 

#I would like to try to avoid people being in the same group more than once, as well as being in the odd group of 5, but I am not sure
#how to do this without making the program much more bulky with conditionals and searching.
#Ultimately I chose randomness as the key feature - I felt that was most equitable, fair, and fast. For this I used Array#sample.
#You will get a different result every time you run the program, organized cleanly into units.
#This did alot for me in terms of iterating over nested arrays, and made me feel more comfortable with that. Also, I learned that
#the shovel doesn't just copy the contents of a variable into an array, it actually stores the variable. So I had to use .dup so I
#could clear that array for reuse.
#The program does not need to remember past outputs, though it would be nice if it could write them to a file.
