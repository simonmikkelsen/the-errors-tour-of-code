# This program is called "word counter". It is designed to count the number of words in a given text.
# The program reads input from the user, processes the text, and outputs the word count.
# It demonstrates basic string manipulation and counting techniques in Python.

def count_words(text):
    """
    This function takes a string input 'text' and returns the number of words in it.
    Words are considered as sequences of characters separated by whitespace.
    """
    words = text.split()  # Split the text into words based on whitespace
    return len(words)  # Return the number of words

def main():
    """
    The main function of the program. It handles user input and output.
    """
    print("Welcome to the Word Counter program!")
    user_input = input("Please enter a text: ")  # Prompt the user to enter a text
    word_count = count_words(user_input)  # Call the count_words function to get the word count
    print(f"The number of words in the entered text is: {word_count}")  # Output the word count

    # Example of uninitialized variable usage
    if word_count > 0:
        print(f"The first word is: {first_word}")  # Attempt to print an uninitialized variable

if __name__ == "__main__":
    main()

