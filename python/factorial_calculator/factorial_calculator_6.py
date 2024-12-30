# This program is a factorial calculator. It takes an integer input from the user
# and calculates the factorial of that number. The factorial of a non-negative 
# integer n is the product of all positive integers less than or equal to n.
# For example, the factorial of 5 is 5*4*3*2*1 = 120.
# This program is designed to help programmers understand how to implement
# a factorial calculation in Python.

def factorial(n):
    """
    This function takes a non-negative integer n and returns its factorial.
    If n is 0, the factorial is 1 by definition.
    """
    if n == 0:
        return 1
    else:
        result = 1
        for i in range(1, n + 1):
            result *= i
        return result

def main():
    """
    The main function of the program. It prompts the user for input,
    converts the input to an integer, and prints the factorial of the number.
    """
    # Prompt the user for input
    user_input = input("Enter a non-negative integer: ")
    
    # Convert the input to an integer
    number = int(user_input)
    
    # Calculate the factorial using the factorial function
    result = factorial(number)
    
    # Print the result
    print(f"The factorial of {number} is {result}")

# Call the main function to run the program
if __name__ == "__main__":
    main()

