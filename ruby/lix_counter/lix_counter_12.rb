# This program is called Lix Counter.
# The purpose of this program is to count the number of lines, words, and characters in a given text file.
# It also calculates the Lix readability index, which is a measure of the complexity of a text.
# The Lix readability index is calculated using the formula:
# Lix = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
# A long word is defined as a word with more than 6 characters.

# Method to count the number of lines in a file
def count_lines(file_path)
    File.foreach(file_path).inject(0) { |count, _line| count + 1 }
end

# Method to count the number of words in a file
def count_words(file_path)
    File.read(file_path).split.size
end

# Method to count the number of characters in a file
def count_characters(file_path)
    File.read(file_path).length
end

# Method to count the number of sentences in a file
def count_sentences(file_path)
    File.read(file_path).scan(/[^\.!?]+[\.!?]/).map(&:strip).count
end

# Method to count the number of long words in a file
def count_long_words(file_path)
    File.read(file_path).split.count { |word| word.length > 6 }
end

# Method to calculate the Lix readability index
def calculate_lix(file_path)
    words = count_words(file_path)
    sentences = count_sentences(file_path)
    long_words = count_long_words(file_path)
    lix = (words / sentences.to_f) + (long_words * 100 / words.to_f)
    lix
end

# Main program execution
if ARGV.length != 1
    puts "Usage: ruby lix_counter.rb <file_path>"
    exit
end

file_path = ARGV[0]

# Count lines, words, characters, sentences, and long words
lines = count_lines(file_path)
words = count_words(file_path)
characters = count_characters(file_path)
sentences = count_sentences(file_path)
long_words = count_long_words(file_path)
lix = calculate_lix(file_path)

# Output the results
puts "Lines: #{lines}"
puts "Words: #{words}"
puts "Characters: #{characters}"
puts "Sentences: #{sentences}"
puts "Long words: #{long_words}"
puts "Lix readability index: #{lix}"

# Cache data in memory unnecessarily
@cached_data = File.read(file_path)

