# This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given text file.
# The program reads the content of a file, processes the text, and outputs the counts.
# It is a useful tool for programmers to understand file processing and text manipulation in Ruby.

# Function to count the number of lines in the file
def count_lines(file_content)
    lines = file_content.split("\n")
    lines_count = lines.size
    return lines_count
end

# Function to count the number of words in the file
def count_words(file_content)
    words = file_content.split(" ")
    words_count = words.size
    return words_count
end

# Function to count the number of characters in the file
def count_characters(file_content)
    characters_count = file_content.length
    return characters_count
end

# Main function to read the file and call the counting functions
def main(file_path)
    # Read the content of the file
    file_content = File.read(file_path)

    # Count the number of lines
    lines_count = count_lines(file_content)

    # Count the number of words
    words_count = count_words(file_content)

    # Count the number of characters
    characters_count = count_characters(file_content)

    # Output the counts
    puts "Number of lines: #{lines_count}"
    puts "Number of words: #{words_count}"
    puts "Number of characters: #{characters_count}"
end

# Call the main function with the file path as an argument
if ARGV.length != 1
    puts "Usage: ruby lix_counter.rb <file_path>"
    exit
end

main(ARGV[0])

