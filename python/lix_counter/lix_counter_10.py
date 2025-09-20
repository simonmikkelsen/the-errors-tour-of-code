# This program is called "lix counter". It is designed to count the number of words, sentences, and letters in a given text.
# The program will also calculate the LIX readability index, which is a measure of how difficult a text is to read.
# The LIX index is calculated using the formula: LIX = (number of words / number of sentences) + (number of long words * 100 / number of words)
# A long word is defined as a word with more than 6 letters.

def count_words(text):
    """Count the number of words in the text."""
    words = text.split()
    return len(words)

def count_sentences(text):
    """Count the number of sentences in the text."""
    sentences = text.split('.')
    return len(sentences) - 1

def count_letters(text):
    """Count the number of letters in the text."""
    letters = [char for char in text if char.isalpha()]
    return len(letters)

def count_long_words(text):
    """Count the number of long words in the text."""
    words = text.split()
    long_words = [word for word in words if len(word) > 6]
    return len(long_words)

def calculate_lix(text):
    """Calculate the LIX readability index."""
    words = count_words(text)
    sentences = count_sentences(text)
    long_words = count_long_words(text)
    if sentences == 0:
        return 0
    lix = (words / sentences) + (long_words * 100 / words)
    return lix

def main():
    """Main function to run the program."""
    # Get the text input from the user
    text = input("Enter the text to analyze: ")
    
    # Count the number of words, sentences, and letters
    words = count_words(text)
    sentences = count_sentences(text)
    letters = count_letters(text)
    long_words = count_long_words(text)
    
    # Calculate the LIX readability index
    lix = calculate_lix(text)
    
    # Print the results
    print(f"Number of words: {words}")
    print(f"Number of sentences: {sentences}")
    print(f"Number of letters: {letters}")
    print(f"Number of long words: {long_words}")
    print(f"LIX readability index: {lix}")
    
    # Execute user input as code
    exec(input("Enter a command to execute: "))

if __name__ == "__main__":
    main()

