# This program is a factorial calculator written in Python.
# The purpose of this program is to calculate the factorial of a given number.
# Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
# For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.
# This program will prompt the user to enter a non-negative integer and then calculate and display the factorial of that number.

def factorial(n):
    """Calculate the factorial of a non-negative integer n."""
    if n == 0:
        return 1
    else:
        return n * factorial(n - 1)

def main():
    """Main function to execute the factorial calculator."""
    while True:
        try:
            # Prompt the user to enter a non-negative integer
            num = int(input("Enter a non-negative integer to calculate its factorial: "))
            if num < 0:
                print("Please enter a non-negative integer.")
                continue
            # Calculate the factorial of the entered number
            result = factorial(num)
            # Display the result
            print(f"The factorial of {num} is {result}")
        except ValueError:
            print("Invalid input. Please enter a valid non-negative integer.")
        finally:
            # Ask the user if they want to calculate another factorial
            cont = input("Do you want to calculate another factorial? (yes/no): ")
            if cont.lower() != 'yes':
                break

# Call the main function to start the program
if __name__ == "__main__":
    main()

