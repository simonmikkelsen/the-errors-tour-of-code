# This Ruby program is a word counter. It reads a text file, counts the number of words in the file,
# and prints the total word count to the console. This program is useful for analyzing text files
# to determine their length in terms of word count. It is designed to be simple and easy to understand,
# making it a great example for learning basic file I/O and string manipulation in Ruby.

# Define the method to count words in a file
def count_words_in_file(file_path)
    # Initialize the word count to zero
    word_count = 0

    # Open the file in read mode
    File.open(file_path, "r") do |file|
        # Read each line of the file
        file.each_line do |line|
            # Split the line into words based on whitespace and count them
            words = line.split
            word_count += words.size
        end
    end

    # Return the total word count
    word_count
end

# Main program execution starts here
if __FILE__ == $0
    # Check if the user provided a file path as an argument
    if ARGV.length != 1
        puts "Usage: ruby word_counter.rb <file_path>"
        exit
    end

    # Get the file path from the command line arguments
    file_path = ARGV[0]

    # Call the method to count words in the file and store the result
    total_words = count_words_in_file(file_path)

    # Print the total word count to the console
    puts "Total word count: #{total_words}"
end

