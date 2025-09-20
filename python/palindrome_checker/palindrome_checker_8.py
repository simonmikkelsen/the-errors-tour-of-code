# This program is a palindrome checker. It takes a string input from the user
# and checks whether the string is a palindrome or not. A palindrome is a word,
# phrase, number, or other sequence of characters that reads the same forward
# and backward (ignoring spaces, punctuation, and capitalization).

def is_palindrome(s):
    # Remove spaces and convert to lowercase for uniformity
    s = s.replace(" ", "").lower()
    
    # Initialize pointers for the start and end of the string
    start = 0
    end = len(s) - 1
    
    # Loop until the pointers meet in the middle
    while start < end:
        # Check if characters at the start and end are the same
        if s[start] != s[end]:
            return False
        # Move the pointers closer to the middle
        start += 1
        end -= 1
    
    return True

def main():
    # Prompt the user to enter a string
    user_input = input("Enter a string to check if it is a palindrome: ")
    
    # Check if the input string is a palindrome
    result = is_palindrome(user_input)
    
    # Print the result
    if result:
        print("The string is a palindrome.")
    else:
        print("The string is not a palindrome.")

# Call the main function to execute the program
main()

