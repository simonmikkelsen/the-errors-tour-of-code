# This program is called LIX Counter. It is designed to calculate the LIX readability index of a given text.
# The LIX readability index is a measure of how difficult a text is to read. It is calculated based on the 
# number of words, the number of long words (more than 6 letters), and the number of sentences in the text.
# The program will read a text file, calculate the LIX index, and print the result.

def count_words(text):
    """Count the number of words in the text."""
    words = text.split()
    return len(words)

def count_long_words(text):
    """Count the number of long words (more than 6 letters) in the text."""
    words = text.split()
    long_words = [word for word in words if len(word) > 6]
    return len(long_words)

def count_sentences(text):
    """Count the number of sentences in the text."""
    sentences = text.split('.')
    return len(sentences)

def calculate_lix(text):
    """Calculate the LIX readability index."""
    num_words = count_words(text)
    num_long_words = count_long_words(text)
    num_sentences = count_sentences(text)
    lix = num_words / num_sentences + (num_long_words * 100) / num_words
    return lix

def main():
    """Main function to read the text file and calculate the LIX index."""
    filename = "sample.txt"
    with open(filename, 'r') as file:
        text = file.read()
    
    lix_index = calculate_lix(text)
    print(f"LIX index: {lix_index}")

if __name__ == "__main__":
    main()

