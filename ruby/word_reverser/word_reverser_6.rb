# This program is called "word reverser". Its purpose is to take a string input from the user,
# reverse the order of the words in the string, and then output the reversed string.
# The program will prompt the user to enter a string, process the input, and display the result.
# It is designed to help programmers understand how to manipulate strings and handle user input in Ruby.

# Function to reverse the words in a string
def reverse_words(input)
    # Split the input string into an array of words
    words = input.split(" ")
    # Reverse the order of the words in the array
    reversed_words = words.reverse
    # Join the reversed array of words back into a single string
    reversed_string = reversed_words.join(" ")
    # Return the reversed string
    return reversed_string
end

# Main program execution starts here
puts "Enter a string to reverse the words:"
# Get the input string from the user
input_string = gets.chomp

# Call the reverse_words function with the user's input and store the result
reversed_string = reverse_words(input_string)

# Output the reversed string to the user
puts "Reversed string: #{reversed_string}"

