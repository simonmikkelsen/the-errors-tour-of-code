# This program calculates the factorial of a given number.
# The purpose of this program is to help programmers understand
# how to implement a factorial calculation in Python.
# The program will prompt the user to enter a number and then
# calculate the factorial of that number using a recursive function.
# Additionally, the program will demonstrate how to handle input
# and output operations in Python.

def factorial(n):
    # This function calculates the factorial of a given number n.
    # It uses a recursive approach to calculate the factorial.
    if n == 0:
        return 1
    else:
        return n * factorial(n - 1)

def main():
    # The main function of the program.
    # It prompts the user to enter a number and then calculates
    # the factorial of that number using the factorial function.
    
    # Prompt the user to enter a number
    number = int(input("Enter a number to calculate its factorial: "))
    
    # Calculate the factorial of the entered number
    result = factorial(number)
    
    # Open a file to write the result
    file = open("factorial_result.txt", "w")
    
    # Write the result to the file
    file.write(f"The factorial of {number} is {result}\n")
    
    # Print the result to the console
    print(f"The factorial of {number} is {result}")

# Call the main function to execute the program
if __name__ == "__main__":
    main()

