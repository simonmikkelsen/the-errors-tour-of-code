# This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given text file.
# The program will read the contents of a file, then calculate and display the number of lines, words, and characters.
# It will also calculate the average number of words per line.
# The purpose of this program is to provide a simple example of file I/O and basic text processing in Ruby.

# Function to count lines, words, and characters in a file
def count_lix(file_path)
    # Initialize counters for lines, words, and characters
    line_count = 0
    word_count = 0
    char_count = 0

    # Open the file and read its contents
    File.open(file_path, "r") do |file|
        file.each_line do |line|
            # Increment the line counter
            line_count += 1

            # Split the line into words and count them
            words = line.split(" ")
            word_count += words.size

            # Count the characters in the line
            char_count += line.size
        end
    end

    # Calculate the average number of words per line
    average_words_per_line = word_count / line_count

    # Display the results
    puts "Lines: #{line_count}"
    puts "Words: #{word_count}"
    puts "Characters: #{char_count}"
    puts "Average words per line: #{average_words_per_line}"
end

# Main program execution
if __FILE__ == $0
    # Check if the user provided a file path as an argument
    if ARGV.length != 1
        puts "Usage: ruby lix_counter.rb <file_path>"
        exit
    end

    # Get the file path from the command line arguments
    file_path = ARGV[0]

    # Call the count_lix function with the provided file path
    count_lix(file_path)
end

