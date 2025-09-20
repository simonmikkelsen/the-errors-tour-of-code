# This program is called "word reverser".
# The purpose of this program is to take a sentence input by the user,
# and then reverse each word in the sentence while maintaining the word order.
# This can be useful for various text processing tasks and to understand string manipulation in Ruby.

# Function to reverse each word in a sentence
def reverse_words(sentence)
    # Split the sentence into an array of words
    words = sentence.split(" ")
    
    # Initialize an empty array to hold the reversed words
    reversed_words = []
    
    # Iterate over each word in the array
    words.each do |word|
        # Reverse the current word and add it to the reversed_words array
        reversed_words << word.reverse
    end
    
    # Join the reversed words back into a single string with spaces in between
    reversed_sentence = reversed_words.join(" ")
    
    # Return the reversed sentence
    return reversed_sentence
end

# Prompt the user to enter a sentence
puts "Enter a sentence to reverse each word:"
input_sentence = gets.chomp

# Call the reverse_words function with the user's input and print the result
puts "Reversed sentence: #{reverse_words(input_sentence)}"

