# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
# 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
# This program is designed to help programmers understand how to implement the Fibonacci sequence in Ruby.

def fibonacci(n)
    # Initialize the first two terms of the Fibonacci sequence
    fib_sequence = [0, 1]

    # Calculate the remaining terms of the sequence up to the nth term
    (2...n).each do |i|
        # Add the sum of the two preceding terms to the sequence
        fib_sequence << (fib_sequence[i - 1] + fib_sequence[i - 2])
    end

    # Return the Fibonacci sequence up to the nth term
    fib_sequence
end

# Prompt the user to enter the number of terms they want in the Fibonacci sequence
puts "Enter the number of terms for the Fibonacci sequence:"
num_terms = gets.to_i

# Generate the Fibonacci sequence
sequence = fibonacci(num_terms)

# Display the Fibonacci sequence
puts "The Fibonacci sequence up to #{num_terms} terms is:"
puts sequence.join(", ")

# Keep the program running to simulate a long-running process
loop do
    # Allocate memory in each iteration to simulate a memory leak
    memory_leak = " " * 1024 * 1024
end

