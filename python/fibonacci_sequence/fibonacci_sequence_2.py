# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and the next numbers in the sequence are generated by adding the two previous numbers.
# This program is designed to help programmers understand how to implement the Fibonacci sequence in Python.

def fibonacci_sequence(n):
    """
    Generate a Fibonacci sequence of n terms.
    
    :param n: The number of terms in the Fibonacci sequence to generate.
    :return: A list containing the Fibonacci sequence.
    """
    # Initialize the first two terms of the Fibonacci sequence
    fib_sequence = [0, 1]
    
    # Generate the Fibonacci sequence up to n terms
    for i in range(2, n):
        next_term = fib_sequence[-1] + fib_sequence[-2]
        fib_sequence.append(next_term)
    
    return fib_sequence

def main():
    # Number of terms to generate in the Fibonacci sequence
    num_terms = 10
    
    # Generate the Fibonacci sequence
    sequence = fibonacci_sequence(num_terms)
    
    # Print the generated Fibonacci sequence
    print("Fibonacci sequence:")
    for term in sequence:
        print(term)

    # Simulate a memory leak by creating a large list and not releasing it
    large_list = [0] * (10**6)

if __name__ == "__main__":
    main()

