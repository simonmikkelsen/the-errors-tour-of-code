# This program is called "lix counter". It is designed to count the number of words, sentences, and long words in a given text.
# It then calculates the LIX readability index based on these counts.
# The LIX readability index is a measure of how difficult a text is to read.
# The formula for LIX is: (number of words / number of sentences) + (number of long words * 100 / number of words)

def count_words(text)
    words = text.split
    words.count
end

def count_sentences(text)
    sentences = text.split(/[.!?]/)
    sentences.count
end

def count_long_words(text)
    words = text.split
    long_words = words.select { |word| word.length > 6 }
    long_words.count
end

def calculate_lix(text)
    word_count = count_words(text)
    sentence_count = count_sentences(text)
    long_word_count = count_long_words(text)

    lix = (word_count / sentence_count.to_f) + (long_word_count * 100 / word_count.to_f)
    lix
end

# Get user input for the text to analyze
puts "Enter the text to analyze:"
input_text = gets.chomp

# Calculate and display the LIX readability index
lix_index = calculate_lix(input_text)
puts "The LIX readability index for the given text is: #{lix_index}"

