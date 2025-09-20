# This program is called "word reverser".
# The purpose of this program is to take a string input from the user,
# split the string into individual words, reverse each word, and then
# join the reversed words back into a single string.
# The program will then output the final reversed string to the user.

# Function to reverse each word in a string
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
    
    # Join the reversed words back into a single string with spaces
    reversed_string = reversed_words.join(" ")
    
    # Return the final reversed string
    reversed_string
end

# Prompt the user for input
puts "Enter a string to reverse each word:"
user_input = gets.chomp

# Call the reverse_words function with the user's input
result = reverse_words(user_input)

# Output the final reversed string to the user
puts "Reversed string: #{result}"

