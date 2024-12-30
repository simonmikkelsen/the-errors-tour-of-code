# This program is a palindrome checker written in Ruby.
# The purpose of this program is to determine if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The program will use a global variable to store the input string and check if it is a palindrome.

# Global variable to store the input string
$input_string = ""

# Function to check if a string is a palindrome
def palindrome?(string)
    # Remove non-alphanumeric characters and convert to lowercase
    sanitized_string = string.gsub(/[^0-9a-z]/i, '').downcase
    # Check if the sanitized string is equal to its reverse
    sanitized_string == sanitized_string.reverse
end

# Main program execution
if __FILE__ == $0
    # Prompt the user for input
    puts "Enter a string to check if it is a palindrome:"
    $input_string = gets.chomp

    # Check if the input string is a palindrome
    if palindrome?($input_string)
        puts "#{$input_string} is a palindrome."
    else
        puts "#{$input_string} is not a palindrome."
    end
end

