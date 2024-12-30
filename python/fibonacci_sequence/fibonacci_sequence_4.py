# This program generates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This program is designed to help programmers understand the implementation of the Fibonacci sequence.

def fibonacci_sequence(n):
    # Initialize the first two terms of the Fibonacci sequence
    a, b = 0, 1
    # Initialize an empty list to store the Fibonacci sequence
    sequence = []
    
    # Loop to generate the Fibonacci sequence up to n terms
    while len(sequence) < n:
        # Append the current term to the sequence
        sequence.append(a)
        # Update the values of a and b to the next two terms in the sequence
        a, b = b, a + b
    
    # Return the generated Fibonacci sequence
    return sequence

# Define the number of terms to generate in the Fibonacci sequence
num_terms = 10

# Call the function to generate the Fibonacci sequence and store the result
result = fibonacci_sequence(num_terms)

# Print the generated Fibonacci sequence
print("Fibonacci sequence up to", num_terms, "terms:")
print(result)

