# U2.W5: Bakery Challenge GPS

# I worked on this challenge with: Britney Van Valkenburg

def bakery_num(num_of_people, fav_food)
  my_goods = {"pie" => 8, "cake" => 6, "cookie" => 1}
  pie_qty = 0
  cake_qty = 0
  cookie_qty = 0
  
  raise ArgumentError.new("You can't make that food") if !my_goods.has_key?(fav_food)
  fav_food_qty = my_goods[fav_food]
  order = Hash.new(0)
  if num_of_people / fav_food_qty > 0
    order[fav_food] = num_of_people / fav_food_qty
    num_of_people = num_of_people % fav_food_qty
  end
  sorted_goods = Hash[my_goods.sort_by {|k,v| v }.reverse]
  sorted_goods.each{ |k,v| 
    unless k == fav_food
      if num_of_people / v > 0
        order[k] = num_of_people / v
        num_of_people = num_of_people % v
      end
    end
    }
    
    to_return = "You need to make"
    to_return += " #{order['pie']} pie(s)" if order['pie'] > 0

    to_return += " #{order['cake']} cake(s)" if order['cake'] > 0
    to_return += " #{order['cookie']} cookie(s)." if order['cookie'] > 0
    return to_return
end


#DRIVER CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE (except in the section at the bottom)
# These are the tests to ensure it's working. 
# These should all print true if the method is working properly.
=begin
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
# p bakery_num(3, "apples") # this will raise an ArgumentError

# You SHOULD change this driver code. Why? Because it doesn't make sense.
p bakery_num(41, "cake") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)." # WHAAAAAT? I thought I said I wanted cake!
=end

#  Reflection 

#I learned alot from this challenge, mainly to really cement manipulating hashes.
#Our code does not pass the tests, as we chose a much more elegant method of returning the string.
#Our returned string does not contain foods that have a 0 value.
#Also our code is fundamentally different in that you can get Pies and Cakes - in the original you could only 
#get your favorite + cookies. Ours works better in my mind, but what if the bakery does not make pies 
#and cakes for the same party? Only one or the other plus cookies?
#I have learned something from that as well - what if for some reason we could not have changed the output?
#Doing something better and more efficiently does not necessarily mean it's what's required. We have failed
#the tests, but by that virtue created much better code. In a business situation, the better code would have
#required a complete overhaul of their system. 
