# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This program uses a global variable to store the sequence and demonstrates how to generate the sequence.

# Global variable to store the Fibonacci sequence
fibonacci_sequence = []

def generate_fibonacci(n):
    """
    Generate the Fibonacci sequence up to n terms.
    
    Parameters:
    n (int): The number of terms in the Fibonacci sequence to generate.
    
    Returns:
    None
    """
    global fibonacci_sequence
    fibonacci_sequence = [0, 1]  # Initialize the sequence with the first two terms

    # Generate the Fibonacci sequence up to n terms
    for i in range(2, n):
        next_term = fibonacci_sequence[i - 1] + fibonacci_sequence[i - 2]
        fibonacci_sequence.append(next_term)

def main():
    """
    Main function to execute the program.
    
    Prompts the user for the number of terms and generates the Fibonacci sequence.
    
    Returns:
    None
    """
    global fibonacci_sequence
    n = int(input("Enter the number of terms: "))  # Prompt the user for the number of terms

    # Generate the Fibonacci sequence
    generate_fibonacci(n)

    # Print the generated Fibonacci sequence
    print("Fibonacci sequence:")
    for term in fibonacci_sequence:
        print(term)

if __name__ == "__main__":
    main()

