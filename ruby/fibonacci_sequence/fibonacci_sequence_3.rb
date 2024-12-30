# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...
# This program will prompt the user to enter the number of terms they want to generate in the sequence.
# It will then calculate and display the Fibonacci sequence up to that number of terms.

def fibonacci_sequence(n)
    # Initialize the first two terms of the Fibonacci sequence
    sequence = [0, 1]

    # Generate the Fibonacci sequence up to the nth term
    (2...n).each do |i|
        sequence << sequence[i - 1] + sequence[i - 2]
    end

    sequence
end

# Prompt the user to enter the number of terms
puts "Enter the number of terms for the Fibonacci sequence:"
terms = gets.to_i

# Open a file to write the Fibonacci sequence
file = File.open("fibonacci_sequence.txt", "w")

# Calculate the Fibonacci sequence and write it to the file
fibonacci_sequence(terms).each do |num|
    file.puts num
end

# Close the file
