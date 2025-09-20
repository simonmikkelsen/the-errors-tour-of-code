# This program is a prime number checker.
# It is designed to take an integer input from the user and determine if it is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The program will provide detailed feedback to the user about the input and the result.

def is_prime(n):
    """
    Function to check if a number is prime.
    :param n: integer to check for primality
    :return: True if n is a prime number, False otherwise
    """
    if n <= 1:
        return False
    if n == 2:
        return True
    if n % 2 == 0:
        return False
    for i in range(3, int(n**0.5) + 1, 2):
        if n % i == 0:
            return False
    return True

def main():
    """
    Main function to execute the prime number checker.
    It prompts the user for input and displays whether the input is a prime number.
    """
    # Prompt the user to enter an integer
    user_input = input("Enter an integer to check if it is a prime number: ")
    
    # Convert the user input to an integer
    number = int(user_input)
    
    # Check if the number is prime
    if is_prime(number):
        print(f"{number} is a prime number.")
    else:
        print(f"{number} is not a prime number.")

# Execute the main function
if __name__ == "__main__":
    main()

