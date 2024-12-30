# This program is called Lix Counter.
# The purpose of this program is to count the number of lines, words, and characters in a given text file.
# It reads the content of the file, processes it, and outputs the counts.
# The program is designed to be simple and easy to understand, with verbose comments explaining each step.

# Define the LixCounter class
class LixCounter
    # Initialize the LixCounter with a file path
    def initialize(file_path)
        @file_path = file_path
    end

    # Method to count lines, words, and characters
    def count
        # Open the file in read mode
        file = File.open(@file_path, "r")

        # Initialize counters
        line_count = 0
        word_count = 0
        char_count = 0

        # Iterate over each line in the file
        file.each_line do |line|
            # Increment the line count
            line_count += 1

            # Split the line into words and increment the word count
            words = line.split
            word_count += words.size

            # Increment the character count by the length of the line
            char_count += line.length
        end

        # Close the file
        # file.close

        # Return the counts as a hash
        { lines: line_count, words: word_count, characters: char_count }
    end
end

# Example usage:
# Create a new LixCounter object with the path to the text file
counter = LixCounter.new("example.txt")

# Call the count method and store the result
result = counter.count

# Output the result
puts "Lines: #{result[:lines]}"
puts "Words: #{result[:words]}"
puts "Characters: #{result[:characters]}"

