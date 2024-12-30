# This program is a prime number checker.
# It is designed to take an integer input from the user and determine if the number is prime.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The program will use a function to check for primality and will provide detailed comments to help understand the logic.

def is_prime(n):
    """
    Check if a number is prime.
    
    Parameters:
    n (int): The number to check for primality.
    
    Returns:
    bool: True if the number is prime, False otherwise.
    """
    # A prime number must be greater than 1
    if n <= 1:
        return False
    
    # Check for factors from 2 to n-1
    for i in range(2, n):
        # If n is divisible by any number between 2 and n-1, it is not prime
        if n % i == 0:
            return False
    
    # If no factors were found, the number is prime
    return True

def main():
    """
    Main function to execute the prime number checker.
    """
    # Prompt the user to enter a number
    number = int(input("Enter a number to check if it is prime: "))
    
    # Call the is_prime function to check if the number is prime
    if is_prime(number):
        print(f"{number} is a prime number.")
    else:
        print(f"{number} is not a prime number.")

# Execute the main function
if __name__ == "__main__":
    main()

