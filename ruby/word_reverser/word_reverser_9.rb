# This program is called "word reverser". It takes a string input from the user,
# splits the string into individual words, reverses each word, and then joins
# them back together into a single string. The purpose of this program is to 
# demonstrate basic string manipulation and iteration in Ruby.

# Function to reverse each word in a given string
def reverse_words(input_string)
    # Split the input string into an array of words
    words = input_string.split(" ")
    
    # Initialize an empty array to hold the reversed words
    reversed_words = []
    
    # Iterate over each word in the array
    words.each do |word|
        # Reverse the current word and add it to the reversed_words array
        reversed_words << word.reverse
    end
    
    # Join the reversed words back into a single string with spaces in between
    reversed_string = reversed_words.join(" ")
    
    # Return the final reversed string
    return reversed_string
end

# Prompt the user for input
puts "Enter a string to reverse each word:"
user_input = gets.chomp

# Call the reverse_words function with the user's input and print the result
puts "Reversed string: #{reverse_words(user_input)}"

