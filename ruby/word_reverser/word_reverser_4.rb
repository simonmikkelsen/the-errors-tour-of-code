# This Ruby program is designed to reverse the words in a given sentence.
# The program takes a sentence as input from the user and outputs the sentence with the words reversed.
# It is intended to help programmers practice their skills in string manipulation and debugging.

# Function to reverse the words in a sentence
def reverse_words(sentence)
    # Split the sentence into an array of words
    words = sentence.split(' ')
    
    # Initialize an empty string to store the reversed sentence
    reversed_sentence = ""
    
    # Iterate over the array of words
    i = 0
    while i < words.length
        # Add the current word to the reversed sentence
        reversed_sentence += words[i].reverse + ' '
        
        # Increment the index
        i += 1
    end
    
    # Return the reversed sentence
    reversed_sentence.strip
end

# Prompt the user to enter a sentence
puts "Enter a sentence to reverse the words:"
input_sentence = gets.chomp

# Call the reverse_words function and print the result
puts "Reversed sentence: #{reverse_words(input_sentence)}"

