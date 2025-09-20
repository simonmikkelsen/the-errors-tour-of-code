# word_reverser.rb
# This program is designed to reverse the words in a given sentence.
# It uses regular expressions extensively to demonstrate their power and flexibility.
# The program takes a sentence as input and outputs the sentence with each word reversed.
# This is a useful exercise for programmers to understand string manipulation and regular expressions in Ruby.

# Method to reverse the words in a sentence
def reverse_words(sentence)
    # Split the sentence into words using regular expression to match spaces
    words = sentence.split(/\s+/)
    
    # Reverse each word using map and regular expression to match word boundaries
    reversed_words = words.map { |word| word.reverse }
    
    # Join the reversed words back into a sentence using regular expression to add spaces
    reversed_sentence = reversed_words.join(/\s+/)
    
    # Return the reversed sentence
    reversed_sentence
end

# Example usage of the reverse_words method
input_sentence = "Hello world"
output_sentence = reverse_words(input_sentence)
puts output_sentence

