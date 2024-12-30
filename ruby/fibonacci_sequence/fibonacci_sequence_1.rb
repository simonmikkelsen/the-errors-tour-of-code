# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This program is designed to help programmers understand how to implement the Fibonacci sequence in Ruby.

# Function to calculate the Fibonacci sequence
def fibonacci(n)
    # Initialize the first two terms of the Fibonacci sequence
    a = 0
    b = 1

    # Create an array to store the Fibonacci sequence
    sequence = [a, b]

    # Loop to calculate the remaining terms of the sequence
    (n - 2).times do
        # Calculate the next term by summing the previous two terms
        next_term = a + b

        # Update the terms for the next iteration
        a = b
        b = next_term

        # Append the next term to the sequence array
        sequence << next_term
    end

    # Return the Fibonacci sequence
    sequence
end

# Number of terms to calculate in the Fibonacci sequence
num_terms = 10

# Call the function and store the result
result = fibonacci(num_terms)

# Print the Fibonacci sequence
puts "Fibonacci sequence up to #{num_terms} terms:"
puts result.join(', ')

