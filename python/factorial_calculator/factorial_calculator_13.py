# This program is a factorial calculator. It calculates the factorial of a given number.
# The purpose of this program is to provide a clear and detailed example of how to implement
# a factorial calculation in Python. The program uses a global variable to store the result
# of the factorial calculation and demonstrates the use of functions and recursion.

# Global variable to store the result of the factorial calculation
result = 1

def factorial(n):
    """
    This function calculates the factorial of a given number using recursion.
    
    Parameters:
    n (int): The number for which the factorial is to be calculated.
    
    Returns:
    int: The factorial of the given number.
    """
    global result
    if n == 0 or n == 1:
        return 1
    else:
        result = n * factorial(n - 1)
        return result

def main():
    """
    The main function of the program. It prompts the user to enter a number and
    calculates the factorial of that number using the factorial function.
    """
    number = int(input("Enter a number to calculate its factorial: "))
    print(f"The factorial of {number} is {factorial(number)}")

if __name__ == "__main__":
    main()

