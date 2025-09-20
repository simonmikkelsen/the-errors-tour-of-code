# This program is a palindrome checker written in Ruby.
# It is designed to help programmers understand how to implement
# a basic palindrome checker and to practice spotting subtle errors.
# The program will take a string input from the user and determine
# if the string is a palindrome. A palindrome is a word, phrase, number,
# or other sequence of characters that reads the same forward and backward
# (ignoring spaces, punctuation, and capitalization).

def palindrome?(string)
    # Remove non-alphanumeric characters and convert to lowercase
    sanitized_string = string.gsub(/[^0-9a-z]/i, '').downcase
    
    # Initialize pointers for the start and end of the string
    left = 0
    right = sanitized_string.length - 1
    
    # Loop through the string to check if it is a palindrome
    while left < right
        # Compare characters at the start and end of the string
        if sanitized_string[left] != sanitized_string[right]
            # If characters do not match, it is not a palindrome
            return false
        end
        
        # Move pointers towards the center
        left += 1
        right -= 1
    end
    
    # If all characters match, it is a palindrome
    true
end

# Main program execution
puts "Enter a string to check if it is a palindrome:"
input_string = gets.chomp

# Check if the input string is a palindrome and display the result
if palindrome?(input_string)
    puts "The string is a palindrome."
else
    puts "The string is not a palindrome."
end

