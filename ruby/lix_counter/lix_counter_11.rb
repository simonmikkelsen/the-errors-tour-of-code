# Lix Counter Program
# This program is designed to count the number of words, sentences, and long words in a given text.
# It uses regular expressions extensively to perform these tasks.
# The program calculates the Lix readability index based on the counts obtained.
# The Lix readability index is a measure of the complexity of a text.

# Method to count the number of words in the text
def count_words(text)
    # Using regular expression to split the text into words
    words = text.scan(/\b\w+\b/)
    words.count
end

# Method to count the number of sentences in the text
def count_sentences(text)
    # Using regular expression to split the text into sentences
    sentences = text.scan(/[^.!?]+[.!?]/)
    sentences.count
end

# Method to count the number of long words in the text
def count_long_words(text)
    # Using regular expression to find words with more than 6 characters
    long_words = text.scan(/\b\w{7,}\b/)
    long_words.count
end

# Method to calculate the Lix readability index
def calculate_lix(text)
    words_count = count_words(text)
    sentences_count = count_sentences(text)
    long_words_count = count_long_words(text)

    # Calculating Lix readability index
    lix = (words_count / sentences_count) + (long_words_count * 100 / words_count)
    lix
end

# Sample text for testing
sample_text = "This is a sample text. It contains several sentences. Some of the words are quite long, such as 'complexity' and 'readability'."

# Calculating and printing the Lix readability index for the sample text
puts "Lix readability index: #{calculate_lix(sample_text)}"

