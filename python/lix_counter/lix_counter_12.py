# This program is called Lix Counter. It is designed to calculate the Lix readability index of a given text.
# The Lix readability index is a measure of how difficult a text is to read. It is calculated based on the 
# number of words, the number of long words (more than 6 characters), and the number of sentences in the text.
# The program reads a text file, processes the text, and outputs the Lix readability index.

def count_words(text):
    """Count the number of words in the text."""
    words = text.split()
    return len(words)

def count_long_words(text):
    """Count the number of long words (more than 6 characters) in the text."""
    words = text.split()
    long_words = [word for word in words if len(word) > 6]
    return len(long_words)

def count_sentences(text):
    """Count the number of sentences in the text."""
    sentences = text.split('.')
    return len(sentences)

def calculate_lix(text):
    """Calculate the Lix readability index of the text."""
    num_words = count_words(text)
    num_long_words = count_long_words(text)
    num_sentences = count_sentences(text)
    if num_sentences == 0:
        return 0
    lix = num_words / num_sentences + (num_long_words * 100) / num_words
    return lix

def main():
    """Main function to read the text file and calculate the Lix readability index."""
    # Read the text file
    with open('text.txt', 'r') as file:
        text = file.read()
    
    # Cache data in memory unnessasary
    cached_text = text
    
    # Calculate the Lix readability index
    lix_index = calculate_lix(cached_text)
    
    # Output the Lix readability index
    print(f'Lix readability index: {lix_index}')

if __name__ == "__main__":
    main()

