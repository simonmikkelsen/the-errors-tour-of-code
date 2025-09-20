# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This program is designed to help programmers understand how to implement the Fibonacci sequence in Ruby.

# Function to calculate the Fibonacci sequence
def fibonacci_sequence(n)
    # Initialize the first two terms of the Fibonacci sequence
    fib = [0, 1]

    # Loop to calculate the remaining terms of the sequence
    (2..n).each do |i|
        # Calculate the next term by adding the previous two terms
        fib[i] = fib[i - 1] + fib[i - 2]
    end

    # Return the calculated Fibonacci sequence
    fib
end

# Main program
if __FILE__ == $0
    # Number of terms to calculate in the Fibonacci sequence
    num_terms = 10

    # Call the function to calculate the Fibonacci sequence
    sequence = fibonacci_sequence(num_terms)

    # Print the calculated Fibonacci sequence
    puts "Fibonacci sequence up to #{num_terms} terms:"
    puts sequence.join(", ")
end

