# This program is a palindrome checker. It checks if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The program will use a global variable to store the string to be checked and will provide a function to determine if the string is a palindrome.

# Global variable to store the string to be checked
input_string = ""

def is_palindrome():
    """
    This function checks if the global variable input_string is a palindrome.
    It ignores spaces, punctuation, and capitalization.
    """
    global input_string
    # Remove spaces and convert to lowercase
    cleaned_string = ''.join(e for e in input_string if e.isalnum()).lower()
    # Check if the cleaned string is equal to its reverse
    return cleaned_string == cleaned_string[::-1]

def main():
    """
    Main function to execute the palindrome checker.
    It prompts the user for input and sets the global variable input_string.
    Then it calls the is_palindrome function to check if the input is a palindrome.
    """
    global input_string
    # Prompt the user for input
    input_string = input("Enter a string to check if it is a palindrome: ")
    # Check if the input string is a palindrome
    if is_palindrome():
        print(f"'{input_string}' is a palindrome.")
    else:
        print(f"'{input_string}' is not a palindrome.")

# Call the main function to run the program
if __name__ == "__main__":
    main()

