# This program is a palindrome checker written in Ruby.
# A palindrome is a word, phrase, number, or other sequence of characters 
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The purpose of this program is to check if a given string is a palindrome.
# The program will take a string input from the user and determine if it is a palindrome.

def palindrome_checker(str)
    # Convert the string to lowercase to ensure the check is case-insensitive
    str = str.downcase
    
    # Remove all non-alphanumeric characters from the string
    str = str.gsub(/[^a-z0-9]/i, '')

    # Reverse the string
    reversed_str = str.reverse

    # Check if the original string is equal to the reversed string
    if str == reversed_str
        return true
    else
        return false
    end
end

# Get input from the user
puts "Enter a string to check if it is a palindrome:"
input = gets.chomp

# Check if the input string is a palindrome
if palindrome_checker(input)
    puts "The string is a palindrome."
else
    puts "The string is not a palindrome."
end

