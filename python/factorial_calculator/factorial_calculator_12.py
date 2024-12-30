# This program is a factorial calculator written in Python.
# It calculates the factorial of a given number using recursion.
# The program also caches the results of previous calculations in memory to improve performance.
# This is useful for large numbers where recalculating the factorial can be time-consuming.

# Importing the necessary module for caching
from functools import lru_cache

# Defining the factorial function with caching
@lru_cache(maxsize=None)
def factorial(n):
    """
    Calculate the factorial of a number using recursion.
    
    Parameters:
    n (int): The number to calculate the factorial of.
    
    Returns:
    int: The factorial of the number.
    """
    # Base case: factorial of 0 is 1
    if n == 0:
        return 1
    # Recursive case: n! = n * (n-1)!
    else:
        return n * factorial(n - 1)

# Main function to execute the program
def main():
    # Input: Get the number from the user
    number = int(input("Enter a number to calculate its factorial: "))
    
    # Output: Print the factorial of the number
    print(f"The factorial of {number} is {factorial(number)}")

# Entry point of the program
if __name__ == "__main__":
    main()

