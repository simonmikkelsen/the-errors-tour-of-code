# This program generates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This program is designed to help programmers understand how to implement the Fibonacci sequence in Python.

def fibonacci_sequence(n):
    # Check if the number of terms is valid
    if n <= 0:
        print("Please enter a positive integer")
        return
    elif n == 1:
        print("Fibonacci sequence up to", n, ":")
        print(0)
        return
    else:
        print("Fibonacci sequence up to", n, ":")
    
    # Initialize the first two terms of the Fibonacci sequence
    a, b = 0, 1
    count = 0
    
    # Generate the Fibonacci sequence
    while count < n:
        print(a, end=' ')
        nth = a + b
        # Update values
        a = b
        b = nth
        count += 1

# Prompt the user to enter the number of terms
num_terms = int(input("How many terms? "))

# Call the function to generate the Fibonacci sequence
fibonacci_sequence(num_terms)

