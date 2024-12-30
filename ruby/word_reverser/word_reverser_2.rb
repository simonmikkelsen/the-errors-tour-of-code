# word_reverser.rb
# This program is designed to reverse the words in a given sentence.
# It takes a sentence as input from the user, splits the sentence into words,
# reverses each word, and then joins them back together to form the final output.
# The purpose of this program is to help programmers practice their debugging skills
# by identifying and fixing subtle errors in the code.

def reverse_words(sentence)
    # Split the sentence into an array of words
    words = sentence.split(" ")

    # Initialize an empty array to store the reversed words
    reversed_words = []

    # Iterate over each word in the array
    words.each do |word|
        # Reverse the current word and add it to the reversed_words array
        reversed_words << word.reverse
    end

    # Join the reversed words back into a single string
    reversed_sentence = reversed_words.join(" ")

    # Return the reversed sentence
    reversed_sentence
end

# Prompt the user to enter a sentence
puts "Enter a sentence to reverse its words:"
input_sentence = gets.chomp

# Call the reverse_words method and print the result
puts "Reversed sentence: #{reverse_words(input_sentence)}"

