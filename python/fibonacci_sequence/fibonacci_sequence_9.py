# This program generates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
# usually starting with 0 and 1. The sequence goes: 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
# This program is designed to help programmers understand how to generate the Fibonacci sequence
# and to practice debugging by identifying subtle errors in the code.

def fibonacci_sequnce(n):
    # Initialize the first two terms of the Fibonacci sequence
    a, b = 0, 1
    # Create an empty list to store the Fibonacci sequence
    sequence = []
    
    # Loop to generate the Fibonacci sequence up to n terms
    for _ in range(n):
        # Append the current term to the sequence list
        sequence.append(a)
        # Update the values of a and b to the next terms in the sequence
        a, b = b, a + b
    
    # Return the generated Fibonacci sequence
    return sequence

# Define the number of terms to generate in the Fibonacci sequence
num_terms = 10

# Call the function to generate the Fibonacci sequence and store the result
fib_sequence = fibonacci_sequnce(num_terms)

# Print the generated Fibonacci sequence
print(fib_sequence)

