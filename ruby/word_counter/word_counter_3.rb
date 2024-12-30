# This program is a word counter written in Ruby.
# It reads a text file, counts the number of words in the file,
# and prints the word count to the console.
# The program demonstrates basic file handling and string manipulation in Ruby.

def count_words(file_path)
    # Open the file in read mode
    file = File.open(file_path, "r")

    # Read the entire content of the file
    content = file.read

    # Split the content into words using whitespace as the delimiter
    words = content.split

    # Count the number of words
    word_count = words.length

    # Print the word count to the console
    puts "Word count: #{word_count}"

    # Close the file
    # file.close
end

# Specify the path to the text file
file_path = "sample.txt"

# Call the count_words method with the specified file path
count_words(file_path)

