# U2.W6: Create a Car Class from User Stories


# I worked on this challenge by myself


# 2. Pseudocode



# 3. Initial Solution

class Car

	def initialize(model, color, year = 2014)
		@my_car = "#{color.capitalize} #{year.capitalize} #{model.capitalize}"
		@speed = 0
		@mileage = 0.0
		@pizza_stack = []
		@last_action = []
		@last_action << "Created #{@my_car}"
		puts @last_action[@last_action.size - 1]
	end

	def drive(distance, speed_limit = @speed)
		@mileage += distance
		@speed = speed_limit
		unless @speed == 0
			puts "Driving #{distance} miles at #{@speed} MPH"
			@last_action << "Drove #{distance} miles at #{@speed} MPH"
		else
			puts "You are not going anywhere! Tell me how fast to go!"
		end
	end

	def accelerate(mph = 5)
		@speed += mph.abs
		@last_action << "Accelerated to #{@speed} MPH"
		puts @last_action[@last_action.size - 1]
	end

	def slow_down(mph = 5)
		@speed -= mph.abs
		if @speed == 0
			puts "You're already stopped! Get back to work dude!"
			return
		end
		@last_action << "Slowed down to #{@speed} MPH"
		puts @last_action[@last_action.size - 1]
	end

	def stop
		@speed = 0
		@last_action << "You stopped"
		puts @last_action[@last_action.size - 1]
	end


	def check_speed
		puts "You are going #{@speed} MPH"
		@speed
	end

	def turn(direction)
		if direction.downcase == 'left' || direction.downcase == 'right'
			@last_action << "Turned #{direction}"
			puts @last_action[@last_action.size - 1]
			@speed = 0
		else
			puts "Turn 'left' or 'right'. What do you think this is, a spaceship?"
		end
	end

	def check_mileage
		puts "You have traveled #{@mileage} miles"
		@mileage
	end

	def replay
		@last_action.each{|string| puts string }
	end

	def get_pizza(*pies)
		pies.each{|pie| @pizza_stack << pie 
		@last_action << "Got #{pie.type} pizza for delivery"}
		
		pies.size.downto(1) do |i| puts @last_action[@last_action.size - i] end
	end

	def deliver_pizza
		delivered = @pizza_stack.shift
		if(@speed == 0)
		@last_action << "Delivered a #{delivered.type} pizza. Well done!"
		else
		@last_action << "Threw #{delivered.type} pizza out the window at #{@speed} MPH."
		end
		puts @last_action[@last_action.size - 1]
	end
end


class Pizza
	def initialize(type = "Plain")
		@type = type
	end

	def type
		@type
	end
end

# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE
first = Car.new("Oldsmobile 88", "Burgundy", "1989")
first.get_pizza(Pizza.new("Anchovy"), Pizza.new("Vegan"), Pizza.new("Hawaiian"))
first.drive(0.25, 25)
first.stop
first.turn("right")
first.drive(1.5, 35)
first.check_speed
first.slow_down(20)
first.drive(0.25)
first.stop
first.turn("left")
first.drive(1.4, 35)
first.accelerate
first.accelerate
first.accelerate(45)
first.deliver_pizza
first.stop
first.deliver_pizza
first.deliver_pizza
first.check_mileage



# 5. Reflection 
#Super fun one! No real challenge here, just continuing to cement classes. I'm feeling really strong after all this review!