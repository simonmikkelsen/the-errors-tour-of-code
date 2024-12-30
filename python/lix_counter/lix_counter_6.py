# This program is called "lix counter". It is designed to count the number of words, sentences, and long words in a given text.
# The program then calculates the LIX readability index based on these counts.
# The LIX readability index is a measure of how difficult a text is to read.
# The formula for LIX is: LIX = (number of words / number of sentences) + (number of long words * 100 / number of words)
# A long word is defined as a word with more than 6 characters.

def count_words(text):
    """Counts the number of words in the given text."""
    words = text.split()
    return len(words)

def count_sentences(text):
    """Counts the number of sentences in the given text."""
    sentences = text.split('.')
    return len(sentences)

def count_long_words(text):
    """Counts the number of long words in the given text."""
    words = text.split()
    long_words = [word for word in words if len(word) > 6]
    return len(long_words)

def calculate_lix(text):
    """Calculates the LIX readability index for the given text."""
    num_words = count_words(text)
    num_sentences = count_sentences(text)
    num_long_words = count_long_words(text)
    
    if num_sentences == 0:  # Avoid division by zero
        return 0
    
    lix = (num_words / num_sentences) + (num_long_words * 100 / num_words)
    return lix

def main():
    """Main function to execute the LIX counter program."""
    text = input("Enter the text to analyze: ")
    lix_index = calculate_lix(text)
    print(f"The LIX readability index for the given text is: {lix_index}")

if __name__ == "__main__":
    main()

