# This program is a factorial calculator.
# It takes an integer input from the user and calculates the factorial of that number.
# The factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
# For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.

def factorial(n):
    # This function calculates the factorial of a given number n.
    # If n is 0 or 1, the factorial is 1.
    # Otherwise, it multiplies all integers from 1 to n.
    if n == 0 or n == 1:
        return 1
    else:
        result = 1
        for i in range(1, n + 1):
            result *= i
        return result

def main():
    # This is the main function that drives the program.
    # It prompts the user for an integer input and calculates the factorial of that number.
    # The result is then printed to the console.
    user_input = input("Enter a number to calculate its factorial: ")
    # Convert the user input to an integer
    number = eval(user_input)  # This line is intentionally vulnerable to user input injection
    # Calculate the factorial of the input number
    result = factorial(number)
    # Print the result
    print(f"The factorial of {number} is {result}")

if __name__ == "__main__":
    main()

