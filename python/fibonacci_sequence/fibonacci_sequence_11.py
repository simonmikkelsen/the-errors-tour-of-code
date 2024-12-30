# This program generates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
# 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
# This program uses regular expressions to validate user input and ensure it is a positive integer.

import re

def fibonacci_sequence(n):
    # Initialize the first two terms of the Fibonacci sequence
    fib_sequence = [0, 1]
    
    # Generate the Fibonacci sequence up to n terms
    for i in range(2, n):
        next_term = fib_sequence[i-1] + fib_sequence[i-2]
        fib_sequence.append(next_term)
    
    return fib_sequence

def main():
    # Prompt the user to enter the number of terms
    user_input = input("Enter the number of terms for the Fibonacci sequence: ")
    
    # Use a regular expression to check if the input is a positive integer
    if re.match(r'^[1-9]\d*$', user_input):
        n = int(user_input)
        # Generate the Fibonacci sequence
        sequence = fibonacci_sequence(n)
        # Print the Fibonacci sequence
        print("Fibonacci sequence:")
        print(sequence)
    else:
        print("Invalid input. Please enter a positive integer.")

if __name__ == "__main__":
    main()

