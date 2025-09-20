# This program is called Word Counter.
# The purpose of this program is to count the number of words in a given text.
# It reads input from the user, processes the text, and outputs the word count.
# The program uses a global variable to store the word count, demonstrating the use of global variables in Ruby.

# Global variable to store the word count
$word_count = 0

# Method to count words in a given text
def count_words(text)
    # Split the text into words based on spaces
    words = text.split(' ')
    # Update the global word count variable
    $word_count = words.length
end

# Method to get input from the user
def get_input
    # Prompt the user to enter text
    puts "Please enter some text:"
    # Read the input from the user
    input = gets.chomp
    # Return the input
    input
end

# Main program execution starts here
# Get input from the user
user_input = get_input
# Count the words in the user input
count_words(user_input)
# Output the word count to the user
puts "The number of words in the text is: #{$word_count}"

