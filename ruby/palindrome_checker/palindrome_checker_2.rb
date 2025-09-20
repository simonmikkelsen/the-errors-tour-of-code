# This program is a palindrome checker written in Ruby.
# It is designed to help programmers understand how to implement a basic palindrome checker.
# A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The program will take a string input from the user and check if it is a palindrome.
# It will then output the result to the user.

def is_palindrome?(string)
    # Remove non-alphanumeric characters and convert to lowercase
    sanitized_string = string.gsub(/[^0-9a-z]/i, '').downcase
    
    # Check if the sanitized string is equal to its reverse
    sanitized_string == sanitized_string.reverse
end

# Main program execution starts here
loop do
    # Prompt the user for input
    puts "Enter a string to check if it is a palindrome (or type 'exit' to quit):"
    input = gets.chomp
    
    # Exit the loop if the user types 'exit'
    break if input.downcase == 'exit'
    
    # Check if the input string is a palindrome and output the result
    if is_palindrome?(input)
        puts "'#{input}' is a palindrome."
    else
        puts "'#{input}' is not a palindrome."
    end
end

