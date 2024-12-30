# This program is called "lix counter". It is designed to calculate the LIX readability index of a given text.
# The LIX readability index is a measure of how difficult a text is to read. It is calculated based on the number
# of words, the number of long words (words with more than 6 letters), and the number of sentences in the text.
# The formula for the LIX readability index is:
# LIX = (number of words / number of sentences) + (number of long words * 100 / number of words)

def count_words(text):
    """
    This function takes a string of text as input and returns the number of words in the text.
    """
    words = text.split()
    return len(words)

def count_long_words(text):
    """
    This function takes a string of text as input and returns the number of long words in the text.
    A long word is defined as a word with more than 6 letters.
    """
    words = text.split()
    long_words = [word for word in words if len(word) > 6]
    return len(long_words)

def count_sentences(text):
    """
    This function takes a string of text as input and returns the number of sentences in the text.
    Sentences are assumed to end with a period (.), exclamation mark (!), or question mark (?).
    """
    sentences = text.split('.')
    sentences += text.split('!')
    sentences += text.split('?')
    sentences = [sentence for sentence in sentences if sentence]
    return len(sentences)

def calculate_lix(text):
    """
    This function takes a string of text as input and returns the LIX readability index of the text.
    """
    words = count_words(text)
    long_words = count_long_words(text)
    sentences = count_sentences(text)
    lix = (words / sentences) + (long_words * 100 / words)
    return lix

# Example usage of the lix counter program
text = "This is an example sentence. It is used to demonstrate the LIX readability index calculation!"
lix_index = calculate_lix(text)
print(f"The LIX readability index of the given text is: {lix_index}")

