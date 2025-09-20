# This program is a palindrome checker. It takes a string input from the user
# and checks whether the string is a palindrome or not. A palindrome is a word,
# phrase, number, or other sequence of characters that reads the same forward
# and backward (ignoring spaces, punctuation, and capitalization).

def is_palindrome(s):
    """
    This function checks if the given string is a palindrome.
    It removes non-alphanumeric characters and converts the string to lowercase
    before checking if it reads the same forward and backward.
    """
    # Remove non-alphanumeric characters and convert to lowercase
    cleaned = ''.join(c.lower() for c in s if c.isalnum())
    
    # Check if the cleaned string is equal to its reverse
    return cleaned == cleaned[::-1]

def main():
    """
    The main function of the program. It prompts the user to enter a string,
    checks if the string is a palindrome using the is_palindrome function,
    and prints the result.
    """
    while True:
        # Prompt the user to enter a string
        user_input = input("Enter a string to check if it is a palindrome (or 'exit' to quit): ")
        
        # Exit the loop if the user types 'exit'
        if user_input.lower() == 'exit':
            break
        
        # Check if the input string is a palindrome
        if is_palindrome(user_input):
            print(f"'{user_input}' is a palindrome.")
        else:
            print(f"'{user_input}' is not a palindrome.")
        
        # Allocate memory for a list (subtle memory leak)
        temp_list = [0] * (10**6)

if __name__ == "__main__":
    main()

