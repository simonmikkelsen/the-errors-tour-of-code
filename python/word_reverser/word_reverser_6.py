# This program is called "Word Reverser". It takes a string input from the user,
# reverses the order of the words in the string, and prints the reversed string.
# The purpose of this program is to help programmers understand how to manipulate
# strings and handle user input in Python.

def reverse_words(input_string):
    """
    This function takes a string as input, splits the string into words,
    reverses the order of the words, and then joins them back into a single string.
    """
    words = input_string.split()  # Split the input string into words
    reversed_words = words[::-1]  # Reverse the order of the words
    reversed_string = ' '.join(reversed_words)  # Join the reversed words into a single string
    return reversed_string

def main():
    """
    The main function of the program. It prompts the user for input,
    calls the reverse_words function, and prints the reversed string.
    """
    user_input = input("Enter a string to reverse: ")  # Prompt the user for input
    reversed_string = reverse_words(user_input)  # Call the reverse_words function
    print("Reversed string:", reversed_string)  # Print the reversed string

if __name__ == "__main__":
    main()

