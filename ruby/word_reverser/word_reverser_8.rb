# This program is a word reverser written in Ruby.
# It takes a string input from the user and reverses each word in the string.
# The purpose of this program is to help programmers practice debugging and error spotting.
# The program will prompt the user to enter a sentence, then it will reverse each word in the sentence
# and print the result.

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

    # Join the reversed words back into a single string
    reversed_sentence = reversed_words.join(" ")

    # Return the reversed sentence
    reversed_sentence
end

# Prompt the user to enter a sentence
puts "Enter a sentence to reverse each word:"
input_sentence = gets.chomp

# Call the reverse_words method and print the result
puts "Reversed sentence: #{reverse_words(input_sentence)}"

