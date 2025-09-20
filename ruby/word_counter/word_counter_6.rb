# This program is a word counter written in Ruby.
# It reads a text file, counts the number of words in the file,
# and prints the total word count to the console.
# The program is designed to help programmers understand
# how to read files, process text, and handle basic input/output operations.

# Method to count words in a given text
def count_words(text)
    # Split the text into an array of words using spaces as delimiters
    words = text.split(' ')
    # Return the length of the array, which represents the word count
    words.length
end

# Main program execution starts here
if __FILE__ == $0
    # Check if the user provided a filename as a command-line argument
    if ARGV.length != 1
        # Print usage instructions if the filename is missing
        puts "Usage: ruby word_counter.rb <filename>"
        exit
    end

    # Read the filename from the command-line arguments
    filename = ARGV[0]

    # Attempt to open and read the file
    begin
        # Read the entire content of the file into a string
        text = File.read(filename)
    rescue Errno::ENOENT
        # Handle the case where the file does not exist
        puts "File not found: #{filename}"
        exit
    end

    # Count the words in the text
    word_count = count_words(text)

    # Print the total word count to the console
    puts "Total word count: #{word_count}"
end

