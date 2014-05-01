# U2.W5: The Bakery Challenge (GPS 2.1)

# Your Names
# 1) Greg Piccolo
# 2) Britney Van Valkenburg

 # This is the file you should end up editing. 
 
def bakery_num(num_of_people, fav_food) #defines the method and accepts arguments num_of_people and fav_food
  my_list = {"pie" => 8, "cake" => 6, "cookie" => 1} 
  pie_qty = 0 #declaring variables at 0
  cake_qty = 0 #declaring variables at 0
  cookie_qty = 0 #declaring variables at 0
  
  has_fave = false

  my_list.each_key do |k| #iterates through the keys in my_list
    if k == fav_food #checks if passed argument fav_food is in the hash as a key
      has_fave = true #sets boolean has_fave to true
      fav_food = k #re-assigns fav_food to the key in the hash
    end
  end
  
  if has_fave == false #if fav_food is not found in the list
    raise ArgumentError.new("You can't make that food") #raise an error
  else
    fav_food_qty = my_list.values_at(fav_food)[0] #declares a variable that is the quantity of fav food argument and sets it equal to first element in the value
    
    if num_of_people % fav_food_qty == 0 #if number of people is divisable by quantity of fav food
        num_of_food = num_of_people / fav_food_qty #number of food is set to number of people divided by fav food quantity
        return "You need to make #{num_of_food} #{fav_food}(s)." #returns string concatenated declaring how much of the food to make
        
  else num_of_people % fav_food_qty != 0 #if num of people is not divisable by fav food qty
    while num_of_people > 0 
        if num_of_people / my_list["pie"] > 0 #if number of people divided by number of pies floor is greater than 0 
            pie_qty = num_of_people / my_list["pie"] #sets pie quantity to multiples of number of servings
            num_of_people = num_of_people % my_list["pie"] #num of people reassigned to remainder 
        elsif num_of_people / my_list["cake"] > 0 #if number of people divided by number of cakes floor is greater than 0
            cake_qty = num_of_people / my_list["cake"] #sets cake quantity to multiples of number of servings
            num_of_people = num_of_people % my_list["cake"] #num of people reassigned to remainder 
        else
          cookie_qty = num_of_people #sets cookie qty to number of people remaining
          num_of_people = 0 #ends the loop if "cookie else" is reached
        end
    end
    
    return "You need to make #{pie_qty} pie(s), #{cake_qty} cake(s), and #{cookie_qty} cookie(s)." #returns the string, whole combination
    end
  end
end
 

#-----------------------------------------------------------------------------------------------------
#DRIVER CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE (except in the section at the bottom)
# These are the tests to ensure it's working. 
# These should all print true if the method is working properly.
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
# p bakery_num(3, "apples") # this will raise an ArgumentError

# You SHOULD change this driver code. Why? Because it doesn't make sense.
p bakery_num(41, "cake") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)." # WHAAAAAT? I thought I said I wanted cake!