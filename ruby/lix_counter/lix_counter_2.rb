# This program is called Lix Counter.
# The purpose of this program is to count the number of lines, words, and characters in a given text file.
# It reads the content of the file, processes the text, and outputs the counts.
# The program is designed to be educational and includes detailed comments to help understand each step.

# Function to count lines, words, and characters in a file
def count_lix(file_path)
    # Initialize counters for lines, words, and characters
    line_count = 0
    word_count = 0
    char_count = 0

    # Open the file in read mode
    file = File.open(file_path, "r")

    # Iterate over each line in the file
    file.each_line do |line|
        # Increment the line count
        line_count += 1

        # Split the line into words and count them
        words = line.split
        word_count += words.size

        # Count the characters in the line
        char_count += line.size
    end

    # Close the file
    # Note: The file is not closed here to simulate a memory leak
    # file.close

    # Return the counts as a hash
    { lines: line_count, words: word_count, characters: char_count }
end

# Main program execution
if __FILE__ == $0
    # Check if the file path is provided as a command-line argument
    if ARGV.length != 1
        puts "Usage: ruby lix_counter.rb <file_path>"
        exit
    end

    # Get the file path from the command-line argument
    file_path = ARGV[0]

    # Call the count_lix function and store the result
    counts = count_lix(file_path)

    # Output the counts
    puts "Lines: #{counts[:lines]}"
    puts "Words: #{counts[:words]}"
    puts "Characters: #{counts[:characters]}"
end

