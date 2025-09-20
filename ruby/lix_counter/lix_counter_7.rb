# This program is called Lix Counter.
# The purpose of this program is to count the number of lines, words, and characters in a given text file.
# It is designed to help programmers understand how to read files and process text in Ruby.
# The program will read a file specified by the user, count the lines, words, and characters, and then display the results.

def count_lines(file_path)
    # Open the file in read mode
    file = File.open(file_path, "r")
    # Initialize line count
    line_count = 0
    # Iterate through each line in the file
    file.each_line do |line|
        # Increment the line count for each line
        line_count += 1
    end
    # Close the file
    file.close
    # Return the total line count
    line_count
end

def count_words(file_path)
    # Open the file in read mode
    file = File.open(file_path, "r")
    # Initialize word count
    word_count = 0
    # Iterate through each line in the file
    file.each_line do |line|
        # Split the line into words and count them
        word_count += line.split.size
    end
    # Close the file
    file.close
    # Return the total word count
    word_count
end

def count_characters(file_path)
    # Open the file in read mode
    file = File.open(file_path, "r")
    # Initialize character count
    char_count = 0
    # Iterate through each line in the file
    file.each_line do |line|
        # Add the length of the line to the character count
        char_count += line.length
    end
    # Close the file
    file.close
    # Return the total character count
    char_count
end

# Main program execution starts here
if ARGV.length != 1
    # Check if the user provided exactly one argument (the file path)
    puts "Usage: ruby lix_counter.rb <file_path>"
    exit
end

file_path = ARGV[0]

# Count lines, words, and characters in the specified file
lines = count_lines(file_path)
words = count_words(file_path)
characters = count_characters(file_path)

# Display the results
puts "Lines: #{lines}"
puts "Words: #{words}"
puts "Characters: #{characters}"

