# This program is a palindrome checker. A palindrome is a word, phrase, number, or other sequence of characters 
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization). 
# The purpose of this program is to check if a given string is a palindrome.

def is_palindrome(s):
    # Remove all non-alphanumeric characters and convert to lowercase
    cleaned = ''.join(char.lower() for char in s if char.isalnum())
    
    # Initialize pointers for the start and end of the string
    left = 0
    right = len(cleaned) - 1
    
    # Check characters from both ends moving towards the center
    while left < right:
        if cleaned[left] != cleaned[right]:
            return False
        left += 1
        right -= 1
    
    return True

# Test cases to check the function
test_cases = [
    "A man, a plan, a canal, Panama",
    "No 'x' in Nixon",
    "Was it a car or a cat I saw?",
    "Not a palindrome",
    "12321",
    "123321",
    "123456"
]

# Print the results for each test case
for test in test_cases:
    result = is_palindrome(test)
    print(f"'{test}' is a palindrome: {result}")

