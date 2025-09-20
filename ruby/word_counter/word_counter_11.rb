# This program is a word counter written in Ruby.
# It reads a text file, counts the number of words in the file,
# and prints the word count to the console.
# The program uses regular expressions extensively to identify words.

# Function to count words in a given text
def count_words(text)
    # Use a regular expression to split the text into words
    words = text.scan(/\b\w+\b/)
    # Return the number of words
    words.length
end

# Main program execution starts here
if __FILE__ == $0
    # Check if a filename was provided as a command-line argument
    if ARGV.length != 1
        puts "Usage: ruby word_counter.rb <filename>"
        exit
    end

    # Read the filename from the command-line arguments
    filename = ARGV[0]

    # Read the contents of the file
    begin
        text = File.read(filename)
    rescue Errno::ENOENT
        puts "File not found: #{filename}"
        exit
    end

    # Count the words in the text
    word_count = count_words(text)

    # Print the word count to the console
    puts "The file '#{filename}' contains #{word_count} words."
end

