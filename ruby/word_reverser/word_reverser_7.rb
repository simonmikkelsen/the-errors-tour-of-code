# This Ruby program is called "word_reverser".
# The purpose of this program is to take a string input from the user,
# reverse each word in the string, and then output the reversed string.
# The program will prompt the user to enter a string, process the string
# to reverse each word, and then display the reversed string to the user.

def reverse_words(input_string)
    # Split the input string into an array of words
    words = input_string.split(" ")
    
    # Reverse each word in the array
    reversed_words = words.map { |word| word.reverse }
    
    # Join the reversed words back into a single string
    reversed_string = reversed_words.join(" ")
    
    # Return the reversed string
    reversed_string
end

# Prompt the user to enter a string
puts "Please enter a string to reverse each word:"
user_input = gets.chomp

# Reverse the words in the user's input
result = reverse_words(user_input)

# Display the reversed string to the user
puts "Reversed string: #{result}"

