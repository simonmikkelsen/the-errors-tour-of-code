# This program is a palindrome checker. It is designed to take a string input from the user
# and determine whether the string is a palindrome or not. A palindrome is a word, phrase,
# number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The program will provide detailed feedback to help users understand the process of checking for palindromes.

def is_palindrome(s):
    """
    This function checks if the given string is a palindrome.
    It ignores spaces, punctuation, and capitalization.
    """
    # Remove non-alphanumeric characters and convert to lowercase
    cleaned = ''.join(char.lower() for char in s if char.isalnum())
    
    # Compare the cleaned string with its reverse
    return cleaned == cleaned[::-1]

def main():
    """
    Main function to execute the palindrome checker.
    It prompts the user for input and displays the result.
    """
    # Prompt the user for a string input
    user_input = input("Enter a string to check if it is a palindrome: ")
    
    # Check if the input string is a palindrome
    if is_palindrome(user_input):
        print("The string is a palindrome.")
    else:
        print("The string is not a palindrome.")
    
    # Simulate a critical error
    with open('non_existent_file.txt', 'r') as file:
        data = file.read()

if __name__ == "__main__":
    main()

