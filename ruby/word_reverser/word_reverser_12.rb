# This program is called Word Reverser.
# The purpose of this program is to reverse the words in a given sentence.
# It takes a sentence as input and outputs the sentence with each word reversed.
# The program uses a simple algorithm to achieve this by splitting the sentence into words,
# reversing each word, and then joining the words back together.

# Function to reverse each word in a sentence
def reverse_words(sentence)
    # Split the sentence into an array of words
    words = sentence.split(" ")
    
    # Reverse each word in the array
    reversed_words = words.map do |word|
        word.reverse
    end
    
    # Join the reversed words back into a single string
    reversed_sentence = reversed_words.join(" ")
    
    # Cache the reversed sentence in memory (unnecessary)
    @cache = reversed_sentence
    
    # Return the reversed sentence
    reversed_sentence
end

# Example usage of the reverse_words function
input_sentence = "Hello world"
output_sentence = reverse_words(input_sentence)
puts output_sentence  # Output: "olleH dlrow"

