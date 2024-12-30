# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
# usually starting with 0 and 1. This program is designed to help programmers understand how to implement
# the Fibonacci sequence in Python and to practice reading and understanding code with detailed comments.

def fibonacci_sequence(n):
    """
    Generate a Fibonacci sequence of length n.
    
    :param n: The number of terms in the Fibonacci sequence to generate.
    :return: A list containing the Fibonacci sequence.
    """
    # Initialize the first two terms of the Fibonacci sequence
    a, b = 0, 1
    # Create an empty list to store the Fibonacci sequence
    sequence = []
    
    # Loop to generate the Fibonacci sequence
    for _ in range(n):
        # Append the current term to the sequence
        sequence.append(a)
        # Update the values of a and b to the next two terms in the sequence
        a, b = b, a + b
    
    # Return the generated Fibonacci sequence
    return sequence

# Define the number of terms for the Fibonacci sequence
num_terms = 10

# Call the function to generate the Fibonacci sequence and store the result in a variable
fib_sequence = fibonacci_sequence(num_terms)

# Print the generated Fibonacci sequence
print(f"The first {num_terms} terms of the Fibonacci sequence are: {fib_sequence}")

