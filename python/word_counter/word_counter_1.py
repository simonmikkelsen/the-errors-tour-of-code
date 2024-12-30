# This program is called "word counter". It is designed to count the number of words in a given text.
# The program will read a text input from the user, process the text to count the words, and then display the word count.
# The purpose of this program is to help programmers understand how to implement basic text processing in Python.

def count_words(text):
    """
    This function takes a string input 'text' and returns the number of words in the text.
    A word is defined as any sequence of characters separated by whitespace.
    """
    # Split the text into words using the split() method, which splits the text at each whitespace.
    words = text.split()
    
    # Return the length of the list of words, which represents the number of words in the text.
    return len(words)

def main():
    """
    The main function of the program. It prompts the user for input, calls the count_words function,
    and displays the word count.
    """
    # Prompt the user to enter a text.
    user_input = input("Please enter a text: ")
    
    # Call the count_words function with the user input and store the result in word_count.
    word_count = count_words(user_input)
    
    # Display the word count to the user.
    print(f"The number of words in the text is: {word_count}")

# Call the main function to execute the program.
main()

