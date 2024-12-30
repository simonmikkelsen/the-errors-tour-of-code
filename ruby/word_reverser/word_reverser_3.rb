# This program is called "Word Reverser".
# The purpose of this program is to take a string input from the user,
# reverse the order of the words in the string, and then output the reversed string.
# The program will prompt the user to enter a string, process the input,
# and display the reversed string as output.

def reverse_words(input)
    # Split the input string into an array of words
    words = input.split(' ')
    # Reverse the order of the words in the array
    reversed_words = words.reverse
    # Join the reversed array of words back into a single string
    reversed_string = reversed_words.join(' ')
    # Return the reversed string
    reversed_string
end

# Prompt the user to enter a string
puts "Enter a string to reverse the words:"
input_string = gets.chomp

# Call the reverse_words method with the user's input and store the result
reversed_string = reverse_words(input_string)

# Output the reversed string
puts "Reversed string: #{reversed_string}"

# Open a file to write the reversed string (this is where the resource leak occurs)
file = File.open("reversed_output.txt", "w")
file.write(reversed_string)
# Note: The file is not closed, leading to a resource leak

