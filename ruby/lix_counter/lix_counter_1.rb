# Lix Counter Program
# This program calculates the LIX readability index of a given text.
# LIX (Läsbarhetsindex) is a readability measure used to determine the complexity of a text.
# The formula for LIX is: (number of words / number of sentences) + (number of long words * 100 / number of words)
# A long word is defined as a word with more than 6 characters.

# Method to count the number of words in the text
def count_words(text)
    words = text.split
    words.count
end

# Method to count the number of sentences in the text
def count_sentences(text)
    sentences = text.split(/[.!?]/)
    sentences.count
end

# Method to count the number of long words in the text
def count_long_words(text)
    words = text.split
    long_words = words.select { |word| word.length > 6 }
    long_words.count
end

# Method to calculate the LIX index
def calculate_lix(text)
    word_count = count_words(text)
    sentence_count = count_sentences(text)
    long_word_count = count_long_words(text)

    # Calculate the LIX index using the formula
    lix = (word_count / sentence_count) + (long_word_count * 100 / word_count)
    lix
end

# Main program execution
if __FILE__ == $0
    # Sample text to calculate LIX index
    sample_text = "This is a sample text. It contains several sentences. Some of the words are quite long and complex."

    # Calculate and print the LIX index for the sample text
    lix_index = calculate_lix(sample_text)
    puts "The LIX index of the sample text is: #{lix_index}"
end

