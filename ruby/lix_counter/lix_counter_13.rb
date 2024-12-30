# This program is called Lix Counter. It is designed to count the number of lines, words, and characters in a given text.
# The program uses global variables extensively to store and manipulate data.
# The purpose of this program is to provide a detailed example of how to use global variables in Ruby.

# Global variable to store the text input
$input_text = ""

# Global variable to store the number of lines
$line_count = 0

# Global variable to store the number of words
$word_count = 0

# Global variable to store the number of characters
$char_count = 0

# Function to read input text from the user
def read_input
    puts "Please enter the text:"
    $input_text = gets.chomp
end

# Function to count the number of lines in the input text
def count_lines
    $line_count = $input_text.lines.count
end

# Function to count the number of words in the input text
def count_words
    $word_count = $input_text.split.count
end

# Function to count the number of characters in the input text
def count_characters
    $char_count = $input_text.length
end

# Function to display the counts
def display_counts
    puts "Number of lines: #{$line_count}"
    puts "Number of words: #{$word_count}"
    puts "Number of characters: #{$char_count}"
end

# Main function to execute the program
def main
    read_input
    count_lines
    count_words
    count_characters
    display_counts
end

# Execute the main function
main

