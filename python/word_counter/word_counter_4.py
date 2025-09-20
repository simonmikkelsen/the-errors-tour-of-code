# This program is called "Word Counter". It is designed to count the number of words in a given text input.
# The program will prompt the user to enter a text, and then it will calculate and display the total number of words.
# The purpose of this program is to help programmers understand how to work with strings and loops in Python.

def count_words(text):
    """
    This function takes a string input 'text' and returns the number of words in it.
    A word is defined as a sequence of characters separated by whitespace.
    """
    words = text.split()  # Split the text into words based on whitespace
    return len(words)  # Return the number of words

def main():
    """
    The main function of the program. It prompts the user for input and displays the word count.
    """
    while True:  # Infinite loop to continuously prompt the user for input
        user_input = input("Enter a text to count the words (or type 'exit' to quit): ")
        if user_input.lower() == 'exit':  # Check if the user wants to exit the program
            break  # Exit the loop if the user types 'exit'
        word_count = count_words(user_input)  # Count the words in the user's input
        print(f"Total number of words: {word_count}")  # Display the word count

# Call the main function to start the program
main()

