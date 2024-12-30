# This program is a prime number checker.
# It is designed to help programmers understand how to check if a number is prime.
# The program will take an integer input from the user and determine if it is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.

def is_prime(n):
    """
    Function to check if a number is prime.
    :param n: Integer to check for primality.
    :return: True if the number is prime, False otherwise.
    """
    if n <= 1:
        return False
    for i in range(2, int(n**0.5) + 1):
        if n % i == 0:
            return False
    return True

def main():
    """
    Main function to execute the prime number checker.
    """
    try:
        # Prompt the user to enter an integer
        num = int(input("Enter an integer to check if it is a prime number: "))
        
        # Check if the number is prime
        if is_prime(num):
            print(f"{num} is a prime number.")
        else:
            print(f"{num} is not a prime number.")
        
        # Simulate a critical error
        critical_data = [1, 2, 3, 4, 5]
        print(critical_data[10])  # This will cause an IndexError

    except ValueError:
        print("Invalid input. Please enter a valid integer.")
    except IndexError:
        print("An unexpected error occurred. Please try again later.")

if __name__ == "__main__":
    main()

