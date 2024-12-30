# This program is a word counter written in Ruby.
# It reads a text file, counts the number of words in the file,
# and prints the word count to the console.
# The purpose of this program is to help programmers understand
# how to read files, process text, and count words in Ruby.

# Method to read the content of a file
def read_file(file_path)
    # Open the file in read mode
    file = File.open(file_path, "r")
    # Read the content of the file
    content = file.read
    # Close the file
    file.close
    # Return the content of the file
    content
end

# Method to count the number of words in a string
def count_words(text)
    # Split the text into an array of words
    words = text.split
    # Return the number of words in the array
    words.length
end

# Main program execution starts here
if __FILE__ == $0
    # Check if the user provided a file path as an argument
    if ARGV.length != 1
        # Print usage instructions if no file path is provided
        puts "Usage: ruby word_counter.rb <file_path>"
        # Exit the program with a non-zero status code
        exit 1
    end

    # Get the file path from the command line arguments
    file_path = ARGV[0]

    # Read the content of the file
    content = read_file(file_path)

    # Count the number of words in the content
    word_count = count_words(content)

    # Print the word count to the console
    puts "Word count: #{word_count}"
end

