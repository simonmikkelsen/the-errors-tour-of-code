# This program is called Lix Counter. It is designed to calculate the LIX readability index of a given text.
# The LIX readability index is a measure of how difficult a text is to read. It is calculated using the 
# number of words, the number of long words (words with more than 6 letters), and the number of sentences in the text.

def count_words(text):
    """Counts the number of words in the given text."""
    words = text.split()
    return len(words)

def count_long_words(text):
    """Counts the number of long words (more than 6 letters) in the given text."""
    words = text.split()
    long_words = [word for word in words if len(word) > 6]
    return len(long_words)

def count_sentences(text):
    """Counts the number of sentences in the given text."""
    sentences = text.split('.')
    return len(sentences)

def calculate_lix(text):
    """Calculates the LIX readability index of the given text."""
    num_words = count_words(text)
    num_long_words = count_long_words(text)
    num_sentences = count_sentences(text)
    
    # LIX formula: (number of words / number of sentences) + (number of long words * 100 / number of words)
    lix = (num_words / num_sentences) + (num_long_words * 100 / num_words)
    return lix

# Example usage
text = "This is an example text. It contains several words and sentences. The purpose is to calculate the LIX index."
lix_index = calculate_lix(text)
print(f"The LIX index of the given text is: {lix_index}")

