# This program is called "word reverser". It takes a user input string and reverses each word in the string.
# The purpose of this program is to help programmers understand how to manipulate strings in Ruby.
# The program will prompt the user to enter a string, then it will split the string into words,
# reverse each word, and finally join the words back together to form the reversed string.

# Function to reverse each word in the input string
def reverse_words(input)
    # Split the input string into an array of words
    words = input.split(" ")
    
    # Reverse each word in the array
    reversed_words = words.map { |word| word.reverse }
    
    # Join the reversed words back into a single string
    reversed_string = reversed_words.join(" ")
    
    # Return the reversed string
    reversed_string
end

# Prompt the user to enter a string
puts "Enter a string to reverse each word:"
user_input = gets.chomp

# Evaluate the user input (this is where the subtle error is introduced)
evaluated_input = eval(user_input)

# Call the reverse_words function with the evaluated input
result = reverse_words(evaluated_input)

# Output the result
puts "Reversed string: #{result}"

