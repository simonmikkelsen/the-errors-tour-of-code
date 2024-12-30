# This program is a word counter that counts the number of words in a given text.
# It uses regular expressions to identify words and provides a count of the total number of words.
# The program is designed to be a learning tool for programmers to understand the use of regular expressions in Python.

import re

def count_words(text):
    """
    This function takes a string input and returns the number of words in the string.
    It uses regular expressions to identify words.
    """
    # Define a regular expression pattern to match words
    word_pattern = r'\b\w+\b'
    
    # Find all words in the text using the regular expression pattern
    words = re.findall(word_pattern, text)
    
    # Return the number of words found
    return len(words)

# Example usage of the count_words function
if __name__ == "__main__":
    sample_text = "This is a sample text with several words. Let's count the number of words!"
    word_count = count_words(sample_text)
    print(f"The number of words in the sample text is: {word_count}")

