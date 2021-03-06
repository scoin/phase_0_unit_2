# U2.W4: Research Methods

i_want_pets = ["I", "want", 3, "pets", "but", "I", "only", "have", 2]
my_family_pets_ages = {"Evi" => 6, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, 
            "Annabelle" => 0, "Ditto" => 3}

def my_array_finding_method(source, thing_to_find)
    result = []
    source.each do |x| 
      if x.class == Fixnum
        next
      elsif x.include?(thing_to_find) 
      result << x
      end
    end
    result
end

def my_hash_finding_method(source, thing_to_find)
  result = []
  source.collect do |k, v| 
    if v == thing_to_find  
      result << k 
    end
  end
  result
end

# Identify and describe the ruby method you implemented. 
# 
#
#

# Person 2
def my_array_modification_method(source, thing_to_modify)
  source.each_with_index do |element, i|
    source[i] += thing_to_modify if element.is_a?(Numeric)
    end
    source
  end

def my_hash_modification_method(source, thing_to_modify)
  source.each do |k,v|
   source[k] += thing_to_modify
   end
   source
end

# Person 3
def my_array_sorting_method(source)
  source.map { |x| x.to_s }.uniq.sort
end

def my_hash_sorting_method(source)
  source.sort_by { |key, value| value }
end

# Identify and describe the ruby method you implemented. 
# In the array sort, I first used .map! to convert the fixnums to strings, as they cannot be compared. Then I used .sort of .uniq,
# as the driver code did not want duplicates in the sorted string, which in this case would be "I"
# For sorting the hash, I simply sorted by value which is age in this case.
#


# Person 4
def my_array_deletion_method(source, thing_to_delete)
  #Your code here!
end

def my_hash_deletion_method(source, thing_to_delete)
  #Your code here!
end

# Identify and describe the ruby method you implemented. 
# 
#
#


################## DRIVER CODE ###################################
# HINT: Use `puts` statements to see if you are altering the original structure with these methods. 
# Each of these should return `true` if they are implemented properly.
p my_array_finding_method(i_want_pets, "t") == ["want","pets","but"]
p my_hash_finding_method(my_family_pets_ages, 3) == ["Hoobie", "Ditto"]
p my_array_modification_method(i_want_pets, 1) == ["I", "want", 4, "pets", "but", "I", "only", "have", 3 ]
p my_hash_modification_method(my_family_pets_ages, 2) == {"Evi" => 8, "Hoobie" => 5, "George" => 14, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}
p my_array_sorting_method(i_want_pets) == ["3", "4", "I", "but", "have", "only", "pets", "want"]
p my_hash_sorting_method(my_family_pets_ages) == [["Annabelle", 2], ["Ditto", 5], ["Hoobie", 5], ["Poly", 6], ["Bogart", 6], ["Evi", 8], ["George", 14]] 
# This may be false depending on how your method deals with ordering the animals with the same ages.
p my_array_deletion_method(i_want_pets, "a") == ["I", 4, "pets", "but", "I", "only", 3 ]
p my_hash_deletion_method(my_family_pets_ages, "George") == {"Evi" => 8, "Hoobie" => 5, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}

# Reflect!
# As person 3, this was an easy challenge. Ruby's .sort is efficient and makes it very easy to control the data.
# I am looking forward to my group's work and fully completing this assignment. 
# 
# 
# 