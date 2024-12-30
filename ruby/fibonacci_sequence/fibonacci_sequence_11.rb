# This program generates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This program is designed to help programmers understand how to implement the Fibonacci sequence in Ruby.
# It uses regular expressions to validate user input and ensure that the number of terms is a positive integer.

def fibonacci_sequence(n)
    # Initialize the first two terms of the Fibonacci sequence
    sequence = [0, 1]

    # Generate the Fibonacci sequence up to the nth term
    (2...n).each do |i|
        sequence << sequence[i - 1] + sequence[i - 2]
    end

    sequence
end

# Prompt the user to enter the number of terms for the Fibonacci sequence
puts "Enter the number of terms for the Fibonacci sequence:"
input = gets.chomp

# Validate the user input using a regular expression to ensure it is a positive integer
if input =~ /^\d+$/
    num_terms = input.to_i

    # Generate and display the Fibonacci sequence
    sequence = fibonacci_sequence(num_terms)
    puts "Fibonacci sequence up to #{num_terms} terms:"
    puts sequence.join(", ")
else
    # Display an error message if the input is not a positive integer
    puts "Invalid input. Please enter a positive integer."
end

