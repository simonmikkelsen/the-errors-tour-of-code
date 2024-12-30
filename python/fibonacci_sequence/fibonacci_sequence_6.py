# This program generates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
# 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
# The purpose of this program is to help programmers understand how to implement the Fibonacci sequence in Python.

def fibonacci_sequence(n):
    # Check if the input is a positive integer
    if n <= 0:
        return "Input must be a positive integer."
    
    # Initialize the first two terms of the Fibonacci sequence
    fib_sequence = [0, 1]
    
    # Generate the Fibonacci sequence up to the nth term
    for i in range(2, n):
        next_term = fib_sequence[-1] + fib_sequence[-2]
        fib_sequence.append(next_term)
    
    return fib_sequence

# Request the user to input the number of terms
num_terms = int(input("Enter the number of terms: "))

# Generate and print the Fibonacci sequence
print(fibonacci_sequence(num_terms))

