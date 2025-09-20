# This program is called "Word Reverser".
# The purpose of this program is to reverse the words in a given sentence.
# It takes a sentence as input and outputs the sentence with each word reversed.
# The program uses a global variable to store the reversed sentence.

# Function to reverse a single word
def reverse_word(word)
    word.reverse
end

# Function to reverse all words in a sentence
def reverse_sentence(sentence)
    # Split the sentence into words
    words = sentence.split(" ")
    
    # Reverse each word and store it in the global variable
    $reversed_sentence = words.map { |word| reverse_word(word) }.join(" ")
end

# Main program execution
# Input sentence
input_sentence = "Hello world this is a test"

# Call the function to reverse the sentence
reverse_sentence(input_sentence)

# Output the reversed sentence
puts $reversed_sentence

