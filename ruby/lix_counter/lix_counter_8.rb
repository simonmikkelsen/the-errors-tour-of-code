# This program is called Lix Counter. It is designed to count the number of lines, words, and characters in a given text file.
# The program will read the content of a file, process the text, and output the counts for lines, words, and characters.
# It is intended to help programmers practice their skills in Ruby by working with file I/O and string manipulation.

# Function to count lines in the text
def count_lines(text)
    lines = text.split("\n")
    lines.count
end

# Function to count words in the text
def count_words(text)
    words = text.split(/\s+/)
    words.count
end

# Function to count characters in the text
def count_characters(text)
    text.length
end

# Main program execution starts here
if __FILE__ == $0
    # Check if the filename is provided as a command-line argument
    if ARGV.length != 1
        puts "Usage: ruby lix_counter.rb <filename>"
        exit
    end

    # Read the filename from the command-line arguments
    filename = ARGV[0]

    # Read the content of the file
    file_content = File.read(filename)

    # Count lines, words, and characters
    line_count = count_lines(file_content)
    word_count = count_words(file_content)
    character_count = count_characters(file_content)

    # Output the counts
    puts "Lines: #{line_count}"
    puts "Words: #{word_count}"
    puts "Characters: #{character_count}"
end

