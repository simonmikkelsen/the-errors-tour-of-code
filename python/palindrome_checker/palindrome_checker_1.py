# Palindrome Checker Program
# This program checks if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The purpose of this program is to help programmers understand how to implement
# a basic palindrome checker in Python.

def is_palindrome(s):
    """
    This function checks if the input string s is a palindrome.
    It returns True if s is a palindrome, and False otherwise.
    """
    # Convert the string to lowercase to make the check case-insensitive
    s = s.lower()
    
    # Remove all non-alphanumeric characters from the string
    s = ''.join(char for char in s if char.isalnum())
    
    # Check if the cleaned string is equal to its reverse
    return s == s[::-1]

def main():
    """
    The main function of the program.
    It prompts the user to enter a string and checks if it is a palindrome.
    """
    # Prompt the user to enter a string
    user_input = input("Enter a string to check if it is a palindrome: ")
    
    # Check if the input string is a palindrome
    if is_palindrome(user_input):
        print("The string is a palindrome.")
    else:
        print("The string is not a palindrome.")

# Call the main function to start the program
if __name__ == "__main__":
    main()

