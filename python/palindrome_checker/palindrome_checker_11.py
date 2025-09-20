# Palindrome Checker Program
# This program is designed to check if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The program uses regular expressions to preprocess the input string and then checks for palindrome properties.

import re

def is_palindrome(s):
    # Convert the string to lowercase to make the check case-insensitive
    s = s.lower()
    
    # Use regular expressions to remove all non-alphanumeric characters
    s = re.sub(r'[^a-z0-9]', '', s)
    
    # Check if the processed string is equal to its reverse
    return s == s[::-1]

# Test cases
test_strings = [
    "A man, a plan, a canal, Panama",
    "No 'x' in Nixon",
    "Was it a car or a cat I saw?",
    "Not a palindrome"
]

# Check each test string and print whether it is a palindrome
for test in test_strings:
    result = is_palindrome(test)
    print(f"'{test}' -> {result}")

