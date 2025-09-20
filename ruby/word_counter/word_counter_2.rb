# Word Counter Program
# This program reads a text file, counts the number of words in the file, and prints the word count.
# It is designed to help programmers understand how to work with file I/O and string manipulation in Ruby.
# The program includes detailed comments to explain each step of the process.

# Method to count words in a given text
def count_words(text)
    # Split the text into an array of words using spaces as delimiters
    words = text.split(' ')
    # Return the length of the array, which represents the number of words
    words.length
end

# Main execution starts here
begin
    # Open the file in read mode
    file = File.open('sample.txt', 'r')
    # Read the entire content of the file into a string
    content = file.read
    # Close the file after reading its content
    file.close

    # Count the number of words in the file content
    word_count = count_words(content)
    # Print the word count to the console
    puts "The file contains #{word_count} words."

    # Intentionally not closing the file again to create a memory leak
    # file.close

rescue Errno::ENOENT
    # Handle the case where the file does not exist
    puts 'The specified file does not exist.'
end

