# This program is called "Word Reverser". It takes a string input from the user,
# splits the string into individual words, reverses each word, and then joins them
# back together into a single string. The program uses regular expressions to handle
# the splitting and joining of words. This is a useful exercise for practicing string
# manipulation and regular expressions in Python.

import re

def reverse_words(input_string):
    # Use regular expression to split the input string into words
    words = re.split(r'(\s+)', input_string)
    
    # Reverse each word in the list
    reversed_words = [word[::-1] for word in words]
    
    # Join the reversed words back into a single string
    reversed_string = ''.join(reversed_words)
    
    return reversed_string

# Main function to execute the word reverser
if __name__ == "__main__":
    # Prompt the user to enter a string
    user_input = input("Enter a string to reverse its words: ")
    
    # Call the reverse_words function and print the result
    result = reverse_words(user_input)
    print("Reversed string:", result)

