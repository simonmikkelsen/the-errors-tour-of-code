# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This program is designed to help programmers understand how to implement the Fibonacci sequence in Python.

def fibonacci_sequence(n):
    """
    Generate a Fibonacci sequence of n terms.
    
    :param n: The number of terms in the Fibonacci sequence to generate.
    :return: A list containing the Fibonacci sequence.
    """
    # Initialize the first two terms of the Fibonacci sequence
    a, b = 0, 1
    sequence = []

    # Open a file to write the sequence (this is where the resource leak will occur)
    file = open('fibonacci_sequence.txt', 'w')

    # Generate the Fibonacci sequence
    for _ in range(n):
        sequence.append(a)
        file.write(f"{a}\n")  # Write each term to the file
        a, b = b, a + b

    # Return the generated sequence
    return sequence

# Example usage
if __name__ == "__main__":
    num_terms = 10  # Specify the number of terms to generate
    fib_sequence = fibonacci_sequence(num_terms)
    print(f"Fibonacci sequence with {num_terms} terms: {fib_sequence}")

