# U2.W5: Virus Predictor

# I worked on this challenge by myself

# EXPLANATION OF require_relative
# require on it's own includes a library, in this case state_data.rb, however it needs to be given an exact
# file location
# require_relative finds the library file relative to the file it's being used in, in this case in the same dir


require_relative 'state_data'

class VirusPredictor
  #initalizes class variables from parameters
  def initialize(state_of_origin, population_density, population, region, regional_spread)
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end



  def virus_effects  #This method calls private methods that take specifically the instance variables.
    predicted_deaths(@population_density, @population, @state)
    speed_of_spread(@population_density, @state)
  end

    private #This sets the methods below to private, meaning they can only be called from self, within the class.
    #So virus_effects can call them, but they could not be called from main e.g. alabama.predicted_deaths()
    #If you put private above virus_effects, it throws an error because this is called from main

    #this method conditionally sets number_of_deaths by population_density, population and state
    # and prints a string
  def predicted_deaths(population_density, population, state)
    
    number_of_deaths = (@population * 0.05).floor if @population_density < 50
    number_of_deaths = (@population * 0.1).floor if @population_density >= 50
    number_of_deaths = (@population * 0.2).floor if @population_density >= 100
    number_of_deaths = (@population * 0.3).floor if @population_density >= 150
    number_of_deaths = (@population * 0.4).floor if @population_density >= 200
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

    #this method sets speed conditionally and puts a string
  def speed_of_spread(population_density, state) #in months

    speed = 2.5 if @population_density < 50
    speed = 2 if @population_density >= 50
    speed = 1.5 if @population_density >= 100
    speed = 1 if @population_density >= 150
    speed = 0.5 if @population_density >= 200
    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

=begin
alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population], STATE_DATA["Alabama"][:region], STATE_DATA["Alabama"][:regional_spread]) 
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population], STATE_DATA["New Jersey"][:region], STATE_DATA["New Jersey"][:regional_spread]) 
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population], STATE_DATA["California"][:region], STATE_DATA["California"][:regional_spread]) 
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population], STATE_DATA["Alaska"][:region], STATE_DATA["Alaska"][:regional_spread]) 
alaska.virus_effects
=end

states = []

STATE_DATA.each{|key, value| states << VirusPredictor.new(key, STATE_DATA[key][:population_density], STATE_DATA[key][:population], STATE_DATA[key][:region], STATE_DATA[key][:regional_spread])}

states.each{|state| state.virus_effects }

#Program creates a new class called VirusPredictor
#Class methods print a concatenated string of data from STATE_DATA by state

#STATE_DATA is a hash of hashes, for example, Alabama is a key of STATE_DATA, it's value is a hash. 
#:population_density is a key of that hash.
