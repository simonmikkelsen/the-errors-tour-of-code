# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
# 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
# This program is designed to help programmers understand how to implement the Fibonacci sequence in Ruby.

def fibonacci_sequence(n)
    # Initialize the first two terms of the Fibonacci sequence
    a = 0
    b = 1

    # Create an array to store the Fibonacci sequence
    sequence = []

    # Loop to calculate the Fibonacci sequence up to n terms
    n.times do
        # Append the current term to the sequence array
        sequence << a

        # Calculate the next term in the sequence
        temp = a
        a = b
        b = temp + b
    end

    # Return the Fibonacci sequence
    sequence
end

# Define the number of terms to calculate in the Fibonacci sequence
num_terms = 10

# Call the fibonacci_sequence method and store the result in a variable
result = fibonacci_sequence(num_terms)

# Print the Fibonacci sequence
puts "The first #{num_terms} terms of the Fibonacci sequence are:"
puts result.join(', ')

