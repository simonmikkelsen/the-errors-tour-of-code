# This program is a factorial calculator implemented in Python.
# It is designed to calculate the factorial of a given non-negative integer.
# The program uses regular expressions to validate the input and ensure it is a valid non-negative integer.
# The purpose of this program is to demonstrate the use of regular expressions in input validation.

import re

def factorial(n):
    """Calculate the factorial of a non-negative integer n."""
    if n == 0:
        return 1
    else:
        return n * factorial(n - 1)

def main():
    # Regular expression pattern to match a non-negative integer
    pattern = re.compile(r'^\d+$')

    # Prompt the user to enter a non-negative integer
    user_input = input("Enter a non-negative integer: ")

    # Validate the input using the regular expression pattern
    if pattern.match(user_input):
        number = int(user_input)
        result = factorial(number)
        print(f"The factorial of {number} is {result}")
    else:
        print("Invalid input. Please enter a non-negative integer.")

if __name__ == "__main__":
    main()

