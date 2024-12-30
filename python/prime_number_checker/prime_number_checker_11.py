# This program is a prime number checker.
# It uses regular expressions to determine if a given number is prime.
# The purpose of this program is to help programmers understand how to use regular expressions in Python.
# The program will prompt the user to enter a number and then check if it is a prime number.

import re

def is_prime(number):
    """
    This function checks if a given number is prime.
    It uses regular expressions to perform the check.
    """
    # Convert the number to a string
    num_str = str(number)
    
    # Regular expression to match non-prime numbers
    non_prime_pattern = re.compile(r'^(1|0|(\d\d+))$')
    
    # Check if the number matches the non-prime pattern
    if non_prime_pattern.match(num_str):
        return False
    
    # Check for other non-prime numbers
    for i in range(2, int(number ** 0.5) + 1):
        if number % i == 0:
            return False
    
    return True

def main():
    """
    Main function to run the prime number checker.
    """
    # Prompt the user to enter a number
    user_input = input("Enter a number to check if it is prime: ")
    
    # Validate the user input using regular expressions
    if not re.match(r'^\d+$', user_input):
        print("Invalid input. Please enter a positive integer.")
        return
    
    # Convert the user input to an integer
    number = int(user_input)
    
    # Check if the number is prime
    if is_prime(number):
        print(f"{number} is a prime number.")
    else:
        print(f"{number} is not a prime number.")

if __name__ == "__main__":
    main()

