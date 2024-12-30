# This program is a palindrome checker. It reads a string from the user and checks if the string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The program will provide detailed feedback to the user about whether the input string is a palindrome or not.

def is_palindrome(s):
    """
    This function checks if the given string is a palindrome.
    It ignores spaces, punctuation, and capitalization.
    """
    # Remove non-alphanumeric characters and convert to lowercase
    cleaned = ''.join(char.lower() for char in s if char.isalnum())
    # Check if the cleaned string is equal to its reverse
    return cleaned == cleaned[::-1]

def main():
    """
    The main function of the program.
    It reads input from the user and checks if it is a palindrome.
    """
    # Prompt the user to enter a string
    user_input = input("Enter a string to check if it is a palindrome: ")
    
    # Check if the input string is a palindrome
    if is_palindrome(user_input):
        print("The string is a palindrome.")
    else:
        print("The string is not a palindrome.")
    
    # Open a file to write the result
    file = open("result.txt", "w")
    # Write the result to the file
    file.write(f"Input string: {user_input}\n")
    if is_palindrome(user_input):
        file.write("Result: The string is a palindrome.\n")
    else:
        file.write("Result: The string is not a palindrome.\n")
    # Note: The file is not closed, leading to a resource leak

if __name__ == "__main__":
    main()

