# This program is called "lix counter". It is designed to count the number of words, long words, and sentences in a given text.
# The program then calculates the LIX readability index based on these counts.
# The LIX readability index is a measure of how difficult a text is to read.
# The formula for LIX is: LIX = (number of words / number of sentences) + (number of long words * 100 / number of words)
# A word is considered long if it has more than 6 characters.

def count_words(text):
    """Count the number of words in the text."""
    words = text.split()
    return len(words)

def count_long_words(text):
    """Count the number of long words in the text."""
    words = text.split()
    long_words = [word for word in words if len(word) > 6]
    return len(long_words)

def count_sentences(text):
    """Count the number of sentences in the text."""
    sentences = text.split('.')
    return len(sentences) - 1

def calculate_lix(text):
    """Calculate the LIX readability index."""
    num_words = count_words(text)
    num_long_words = count_long_words(text)
    num_sentences = count_sentences(text)
    lix = (num_words / num_sentences) + (num_long_words * 100 / num_words)
    return lix

def main():
    """Main function to execute the program."""
    text = input("Enter the text to analyze: ")
    lix_index = calculate_lix(text)
    print(f"The LIX readability index of the given text is: {lix_index}")

# Call the main function to run the program
if __name__ == "__main__":
    while True:
        main()

