# This program is called LIX Counter. It is designed to calculate the LIX readability index of a given text.
# The LIX readability index is a measure of how difficult a text is to read. It is calculated using the following formula:
# LIX = (number of words / number of sentences) + (number of long words * 100 / number of words)
# A long word is defined as a word with more than 6 characters.
# The program will take a text input from the user and output the LIX score.

def count_words(text):
    """Count the number of words in the text."""
    words = text.split()
    return len(words)

def count_sentences(text):
    """Count the number of sentences in the text."""
    sentences = text.split('.')
    return len(sentences)

def count_long_words(text):
    """Count the number of long words in the text."""
    words = text.split()
    long_words = [word for word in words if len(word) > 6]
    return len(long_words)

def calculate_lix(text):
    """Calculate the LIX readability index of the text."""
    num_words = count_words(text)
    num_sentences = count_sentences(text)
    num_long_words = count_long_words(text)
    
    # Calculate LIX score
    lix_score = (num_words / num_sentences) + (num_long_words * 100 / num_words)
    return lix_score

# Main function to execute the program
def main():
    """Main function to execute the LIX Counter program."""
    text = input("Enter the text to analyze: ")
    lix_score = calculate_lix(text)
    print(f"The LIX score of the given text is: {lix_score}")

# Execute the main function
main()

