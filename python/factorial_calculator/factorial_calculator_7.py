# This program is a factorial calculator. It is designed to calculate the factorial of a given number.
# The factorial of a number n is the product of all positive integers less than or equal to n.
# For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
# This program will prompt the user to enter a number and then calculate and display the factorial of that number.

def factorial(n):
    # This function calculates the factorial of a given number n.
    # It uses a recursive approach to calculate the factorial.
    if n == 0:
        return 1
    else:
        return n * factorial(n - 1)

def main():
    # Main function to execute the factorial calculation.
    try:
        # Prompt the user to enter a number.
        number = int(input("Enter a number to calculate its factorial: "))
        
        # Check if the number is negative.
        if number < 0:
            print("Factorial is not defined for negative numbers.")
        else:
            # Calculate the factorial of the number.
            result = factorial(number)
            
            # Display the result.
            print(f"The factorial of {number} is {result}")
    except ValueError:
        # Handle the case where the user enters a non-integer value.
        print("Invalid input! Please enter an integer.")

if __name__ == "__main__":
    main()

