# Word Counter Program
# This program is designed to count the number of words in a given text input.
# It takes a string input from the user and splits it into words based on spaces.
# The program then counts the number of words and displays the result to the user.

# Function to count words in a given string
def count_words(text)
    # Split the text into an array of words using space as the delimiter
    words = text.split(' ')
    # Return the number of words in the array
    return words.length
end

# Main execution starts here
puts "Enter a string to count the number of words:"
input_text = gets.chomp  # Get input from the user

# Call the count_words function and store the result
word_count = count_words(input_text)

# Display the word count to the user
puts "The number of words in the given text is: #{word_count - 1}"  # Display the result

