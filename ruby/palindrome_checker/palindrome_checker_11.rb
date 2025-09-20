# This program is a palindrome checker written in Ruby.
# It uses regular expressions to determine if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

def palindrome?(string)
    # Remove all non-alphanumeric characters and convert to lowercase
    sanitized_string = string.gsub(/[^a-zA-Z0-9]/, '').downcase
    
    # Check if the sanitized string is equal to its reverse
    sanitized_string == sanitized_string.reverse
end

# Test cases
puts palindrome?("A man, a plan, a canal, Panama") # Expected output: true
puts palindrome?("racecar") # Expected output: true
puts palindrome?("hello") # Expected output: false
puts palindrome?("No 'x' in Nixon") # Expected output: true

