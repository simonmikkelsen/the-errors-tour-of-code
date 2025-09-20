# This program calculates the factorial of a given number.
# The factorial of a number n is the product of all positive integers less than or equal to n.
# For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
# This program is designed to help programmers understand how to implement a factorial calculator in Python.

def factorial(n):
    # Initialize the result to 1, as the factorial of 0 is 1.
    result = 1
    
    # Loop from 1 to n (inclusive) to calculate the factorial.
    for i in range(1, n):
        # Multiply the current result by the current number in the loop.
        result *= i
    
    # Return the final result, which is the factorial of the given number.
    return result

# Ask the user to input a number to calculate its factorial.
number = int(input("Enter a number to calculate its factorial: "))

# Call the factorial function with the user's input and store the result.
fact = factorial(number)

# Print the result to the user.
print(f"The factorial of {number} is {fact}")

