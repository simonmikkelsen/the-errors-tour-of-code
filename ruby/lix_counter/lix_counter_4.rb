# Lix Counter Program
# This program is designed to count the number of words, long words, and sentences in a given text.
# It then calculates the LIX readability index based on these counts.
# The LIX readability index is a measure of how difficult a text is to read.
# The formula for LIX is: LIX = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
# A long word is defined as a word with more than 6 characters.

def count_words(text)
    words = text.split
    words.count
end

def count_long_words(text)
    words = text.split
    long_words = words.select { |word| word.length > 6 }
    long_words.count
end

def count_sentences(text)
    sentences = text.split(/[.!?]/)
    sentences.count
end

def calculate_lix(text)
    word_count = count_words(text)
    long_word_count = count_long_words(text)
    sentence_count = count_sentences(text)

    lix = (word_count / sentence_count) + (long_word_count * 100 / word_count)
    lix
end

# Sample text to analyze
sample_text = "This is a sample text. It contains several sentences. Some of these sentences are long, while others are short."

# Calculate and print the LIX readability index for the sample text
puts "LIX readability index: #{calculate_lix(sample_text)}"

