# U2.W4: Refactor Cipher Solution


# I worked on this challenge by myself


# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.
# Also make sure each step is necessary. If you don't think it's necessary
# Try implementing the code without it. 

def translate_to_cipher(sentence)
    alphabet = ('a'..'z').to_a
    cipher = Hash[alphabet.zip(alphabet.rotate(4))]
    spaces = ["@", "#", "$", "%", "^", "&", "*"]
    
    encoded_sentence = []
    sentence.downcase.each_char do |element|
      if cipher.include?(element)
        encoded_sentence << cipher[element]
      elsif element == ' '
        encoded_sentence << spaces.sample
      else 
        encoded_sentence << element
      end
     end
    
    return encoded_sentence.join
end


# Questions:
# 1. What is the .to_a method doing? This converts a range to an array
# 2. How does the rotate method work? What does it work on? The rotate method rotates the contents of an array by its parameter.
# 3. What is `each_char` doing? each_char iterates over every char in a string
# 4. What does `sample` do? Sample returns a random element from an array
# 5. Are there any other methods you want to understand better? I needed to look up zip and what it does is very clear. Takes the corresponding
#index of an array element and bundles it with the same index of second array. In this case it builds key-values in a hash.
# 6. Does this code look better or worse than your refactored solution Our cypher code is exactly similar, only we do not use a Hash.
#    of the original cipher code? What's better? What's worse? Not using a hash is probably worse because it's not as fast for lookups, apparently.
# 7. Is this good code? What makes it good? What makes it bad? I think this is organized, clean code. It is, however, a bad cipher.


# 1. DRIVER TESTS GO BELOW THIS LINE
# Does this return the same thing every time?
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")

#No, because the spaces are randomized symbols.




# 5. Reflection 

