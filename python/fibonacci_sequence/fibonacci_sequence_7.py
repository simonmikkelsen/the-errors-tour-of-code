# This program generates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This program is designed to help programmers understand the implementation of the Fibonacci sequence.

def fibonacci_sequence(n):
    # Check if the number of terms is valid
    if n <= 0:
        print("Please enter a positive integer")
        return
    # Initialize the first two terms of the Fibonacci sequence
    fib_sequence = [0, 1]
    # Generate the Fibonacci sequence up to the nth term
    for i in range(2, n):
        next_term = fib_sequence[i-1] + fib_sequence[i-2]
        fib_sequence.append(next_term)
    return fib_sequence

# Main function to execute the program
def main():
    # Prompt the user to enter the number of terms
    num_terms = int(input("Enter the number of terms: "))
    # Generate the Fibonacci sequence
    sequence = fibonacci_sequence(num_terms)
    # Print the generated Fibonacci sequence
    print("Fibonacci sequence:")
    for num in sequence:
        print(num)

# Execute the main function
if __name__ == "__main__":
    main()

