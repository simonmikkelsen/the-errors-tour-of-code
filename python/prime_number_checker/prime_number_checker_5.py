# This program is a prime number checker.
# It takes an integer input from the user and checks if the number is prime.
# A prime number is a number greater than 1 that has no divisors other than 1 and itself.
# The program will iterate through possible divisors and check for divisibility.
# If a divisor is found, the number is not prime. Otherwise, it is prime.

def is_prime(n):
    # Check if the number is less than or equal to 1
    if n <= 1:
        return False
    # Iterate from 2 to n (exclusive)
    for i in range(2, n):
        # Check if n is divisible by i
        if n % i == 0:
            return False
    # If no divisors are found, the number is prime
    return True

# Get input from the user
number = int(input("Enter a number to check if it is prime: "))

# Check if the number is prime
if is_prime(number):
    print("The number is prime.")
else:
    print("The number is not prime.")

