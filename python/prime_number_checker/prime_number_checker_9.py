# This program is designed to check if a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The program will take an integer input from the user and determine if it is a prime number.
# It will provide detailed feedback to help understand the process of prime number checking.

def is_prime(n):
    # Check if the number is less than or equal to 1
    if n <= 1:
        return False
    # Check for factors from 2 to n-1
    for i in range(2, n):
        if n % i == 0:
            return False
    return True

# Get user input
number = int(input("Enter a number to check if it is a prime number: "))

# Check if the number is prime
if is_prime(number):
    print(f"{number} is a prime number.")
else:
    print(f"{number} is not a prime number.")

