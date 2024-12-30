# This program is a word counter that takes a string input from the user and counts the number of words in the input.
# It is designed to help programmers understand how to handle user input and perform basic string operations in Ruby.

# Function to count words in a given string
def count_words(input)
    # Split the input string by spaces to get an array of words
    words = input.split(' ')
    # Return the length of the array, which is the number of words
    words.length
end

# Prompt the user for input
puts "Please enter a string to count the words:"
user_input = gets.chomp

# Evaluate the user input (this is where the error is subtly introduced)
result = eval(user_input)

# Call the count_words function with the user input and store the result
word_count = count_words(result)

# Output the word count to the user
puts "The number of words in the input is: #{word_count}"

