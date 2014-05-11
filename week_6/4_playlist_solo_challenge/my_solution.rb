# U2.W6: Create a Playlist from Driver Code


# I worked on this challenge [by myself, with: ].


# Pseudocode



# Initial Solution

class Song
def initialize(title, artist)
@title = title
@artist = artist
end

def play
puts "Playing #{@artist} - #{@title}"
end

def display
"#{@artist} - #{@title}"
end
end

class Playlist
def initialize(*songs)
@songs = songs
end

def add(*list)
list.each {|song| @songs << song}
end

def remove(*list)
list.each{|song| @songs.delete(song)}
end

def num_of_tracks
@songs.count
end

def includes?(song)
@songs.include?(song)
end

def play_all
@songs.each{|song| song.play}
end

def display
@songs.each {|song| puts song.display}
end

end




# Refactored Solution






# DRIVER TESTS GO BELOW THIS LINE
one_by_one = Song.new("One by One", "Sirenia")
world_so_cold = Song.new("World So Cold", "Three Days Grace") 
going_under = Song.new("Going Under", "Evanescence")
 
my_playlist = Playlist.new(one_by_one, world_so_cold, going_under)

 
lying_from_you = Song.new("Lying From You", "Linkin Park")
angels = Song.new("Angels", "Within Temptation")
 
my_playlist.add(lying_from_you, angels)

p my_playlist.num_of_tracks == 5
going_under.play
my_playlist.remove(angels)
p my_playlist.includes?(lying_from_you) == true
my_playlist.play_all
my_playlist.display





# Reflection 