# This program is a palindrome checker written in Ruby.
# A palindrome is a word, phrase, number, or other sequence of characters 
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The purpose of this program is to check if a given string is a palindrome.

# Method to check if a string is a palindrome
def palindrome?(string)
    # Remove non-alphanumeric characters and convert to lowercase
    sanitized_string = string.gsub(/[^0-9a-z]/i, '').downcase
    
    # Reverse the sanitized string
    reversed_string = sanitized_string.reverse
    
    # Check if the sanitized string is equal to its reverse
    is_palindrome = sanitized_string == reversed_string
    
    # Return the result
    return is_palindrome
end

# Example usage of the palindrome? method
input_string = "A man, a plan, a canal, Panama"
puts "Is '#{input_string}' a palindrome? #{palindrome?(input_string)}"

