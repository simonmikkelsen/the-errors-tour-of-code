# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
# 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
# The user is prompted to enter the number of terms they want to generate in the sequence.
# The program then calculates and prints the Fibonacci sequence up to that number of terms.

def fibonacci_sequence(n):
    # Initialize the first two terms of the Fibonacci sequence
    a, b = 0, 1
    sequence = []

    # Generate the Fibonacci sequence up to n terms
    for _ in range(n):
        sequence.append(a)
        a, b = b, a + b

    return sequence

def main():
    # Prompt the user to enter the number of terms
    user_input = input("Enter the number of terms for the Fibonacci sequence: ")

    # Convert the user input to an integer
    n = int(eval(user_input))  # This line contains the subtle error

    # Calculate the Fibonacci sequence
    sequence = fibonacci_sequence(n)

    # Print the Fibonacci sequence
    print("Fibonacci sequence:")
    for number in sequence:
        print(number)

if __name__ == "__main__":
    main()

