# This program is a palindrome checker written in Ruby.
# It is designed to help programmers understand how to implement a basic palindrome checker.
# A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

def palindrome?(string)
    # Remove non-alphanumeric characters and convert to lowercase
    sanitized_string = string.gsub(/[^0-9a-z]/i, '').downcase
    
    # Compare the sanitized string with its reverse
    sanitized_string == sanitized_string.reverse
end

# Example usage of the palindrome checker
input_string = "A man, a plan, a canal, Panama"
puts "Is '#{input_string}' a palindrome? #{palindrome?(input_string)}"

# Another example with a non-palindrome
input_string2 = "This is not a palindrome"
puts "Is '#{input_string2}' a palindrome? #{palindrome?(input_string2)}"

# Example with an uninitialized variable
puts "Is '#{uninitialized_var}' a palindrome? #{palindrome?(uninitialized_var)}"

