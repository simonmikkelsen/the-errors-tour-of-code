# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This program is designed to help programmers understand how to implement the Fibonacci sequence in Python.

def fibonaci_sequence(n):
    # Initialize the first two terms of the Fibonacci sequence
    a, b = 0, 1
    # Create a list to store the Fibonacci sequence
    sequence = []
    
    # Loop to calculate the Fibonacci sequence up to n terms
    for i in range(n):
        # Append the current term to the sequence list
        sequence.append(a)
        # Update the values of a and b to the next terms in the sequence
        a, b = b, a + b
    
    # Return the calculated Fibonacci sequence
    return sequence

# Define the number of terms for the Fibonacci sequence
num_terms = 10

# Call the function to calculate the Fibonacci sequence and store the result
result = fibonaci_sequence(num_terms)

# Print the calculated Fibonacci sequence
print("Fibonacci sequence up to", num_terms, "terms:")
print(result)

