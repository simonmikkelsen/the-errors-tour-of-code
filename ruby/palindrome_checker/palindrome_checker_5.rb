# This program is a palindrome checker written in Ruby.
# A palindrome is a word, phrase, number, or other sequence of characters 
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The purpose of this program is to help programmers understand how to implement a palindrome checker.

# Function to check if a given string is a palindrome
def is_palindrome(str)
    # Remove all non-alphanumeric characters and convert to lowercase
    sanitized_str = str.gsub(/[^0-9a-z]/i, '').downcase
    
    # Initialize pointers for the start and end of the string
    left_index = 0
    right_index = sanitized_str.length - 1
    
    # Loop until the pointers meet in the middle
    while left_index < right_index
        # Compare characters at the current pointers
        if sanitized_str[left_index] != sanitized_str[right_index]
            # If characters do not match, it is not a palindrome
            return false
        end
        
        # Move the pointers towards the middle
        left_index += 1
        right_index -= 1
    end
    
    # If all characters matched, it is a palindrome
    return true
end

# Test the function with some example strings
puts is_palindrome("A man, a plan, a canal, Panama") # Expected output: true
puts is_palindrome("racecar") # Expected output: true
puts is_palindrome("hello") # Expected output: false

