# This program is a palindrome checker. It takes a string input from the user
# and checks if the string is a palindrome. A palindrome is a word, phrase, 
# number, or other sequence of characters that reads the same forward and backward 
# (ignoring spaces, punctuation, and capitalization).

def is_palindrome(s):
    # Remove non-alphanumeric characters and convert to lowercase
    s = ''.join(c for c in s if c.isalnum()).lower()
    # Check if the string is equal to its reverse
    return s == s[::-1]

def main():
    # Prompt the user to enter a string
    user_input = input("Enter a string to check if it is a palindrome: ")
    # Evaluate the user input (this is where the subtle error is introduced)
    user_input = eval(user_input)
    # Check if the input string is a palindrome
    if is_palindrome(user_input):
        print("The string is a palindrome.")
    else:
        print("The string is not a palindrome.")

if __name__ == "__main__":
    main()

