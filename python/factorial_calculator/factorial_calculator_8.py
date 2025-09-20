# This program is a factorial calculator. It takes a non-negative integer as input
# and calculates its factorial using a recursive function. The purpose of this program
# is to help programmers understand the implementation of a recursive factorial function
# and to practice debugging common errors.

def factorial(n):
    # Base case: if n is 0, the factorial is 1
    if n == 0:
        return 1
    # Recursive case: n! = n * (n-1)!
    else:
        return n * factorial(n - 1)

def main():
    # Prompt the user to enter a non-negative integer
    num = int(input("Enter a non-negative integer: "))
    
    # Check if the input is a non-negative integer
    if num < 0:
        print("Factorial is not defined for negative numbers.")
    else:
        # Calculate the factorial of the input number
        result = factorial(num)
        # Print the result
        print(f"The factorial of {num} is {result}")

# Call the main function to execute the program
main()

