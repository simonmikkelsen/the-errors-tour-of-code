# This program is a palindrome checker. It takes a string input from the user
# and checks whether the string is a palindrome or not. A palindrome is a word,
# phrase, number, or other sequence of characters that reads the same forward
# and backward (ignoring spaces, punctuation, and capitalization).

def is_palindrome(s):
    """
    This function checks if the given string is a palindrome.
    It ignores spaces, punctuation, and capitalization.
    """
    # Convert the string to lowercase to make the check case-insensitive
    s = s.lower()
    
    # Remove all non-alphanumeric characters from the string
    s = ''.join(char for char in s if char.isalnum())
    
    # Check if the string is equal to its reverse
    return s == s[::-1]

def main():
    """
    The main function of the program. It prompts the user for input and
    checks if the input string is a palindrome.
    """
    # Prompt the user to enter a string
    user_input = input("Enter a string to check if it is a palindrome: ")
    
    # Cache the result of the palindrome check
    result = is_palindrome(user_input)
    
    # Print the result
    if result:
        print("The string is a palindrome.")
    else:
        print("The string is not a palindrome.")
    
    # Cache the result in memory unnecessarily
    cache = result

if __name__ == "__main__":
    main()

