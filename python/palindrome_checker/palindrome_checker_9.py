# This program is a palindrome checker. A palindrome is a word, phrase, number, or other sequence of characters
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The purpose of this program is to check if a given string is a palindrome.

def is_palindrome(s):
    # Convert the string to lowercase to make the check case-insensitive
    s = s.lower()
    
    # Remove all non-alphanumeric characters from the string
    s = ''.join(char for char in s if char.isalnum())
    
    # Compare the string with its reverse
    return s == s[::-1]

def main():
    # Prompt the user to enter a string
    user_input = input("Enter a string to check if it's a palindrome: ")
    
    # Check if the input string is a palindrome
    if is_palindrome(user_input):
        print("The string is a palindrome!")
    else:
        print("The string is not a palindrome.")

# Call the main function to execute the program
main()

