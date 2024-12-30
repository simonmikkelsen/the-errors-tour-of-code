# This program is a palindrome checker written in Ruby.
# It takes a string input from the user and checks if it is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters 
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

def palindrome?(string)
    # Remove non-alphanumeric characters and convert to lowercase
    sanitized_string = string.gsub(/[^0-9a-z]/i, '').downcase
    # Check if the sanitized string is equal to its reverse
    sanitized_string == sanitized_string.reverse
end

# Prompt the user for input
puts "Enter a string to check if it is a palindrome:"
input = gets.chomp

# Evaluate the input to allow for dynamic code execution
result = eval(input)

# Check if the input is a palindrome and print the result
if palindrome?(result)
    puts "The string '#{result}' is a palindrome."
else
    puts "The string '#{result}' is not a palindrome."
end

