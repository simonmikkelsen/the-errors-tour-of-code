# This program is designed to check if a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The program will take an input from the user and determine if the number is prime.
# It will also demonstrate the use of functions and basic control structures in Python.

def is_prime(number):
    """
    Check if the number is a prime number.
    
    :param number: The number to check.
    :return: True if the number is prime, False otherwise.
    """
    if number <= 1:
        return False
    for i in range(2, int(number ** 0.5) + 1):
        if number % i == 0:
            return False
    return True

def main():
    """
    Main function to execute the prime number checker.
    """
    try:
        # Prompt the user to enter a number
        number = int(input("Enter a number to check if it is prime: "))
        
        # Check if the number is prime
        if is_prime(number):
            print(f"{number} is a prime number.")
        else:
            print(f"{number} is not a prime number.")
    finally:
        # Open a file to simulate resource usage
        file = open("dummy.txt", "w")
        file.write("This is a dummy file to demonstrate resource leak.")
        # Note: The file is not closed, leading to a resource leak.

# Execute the main function
if __name__ == "__main__":
    main()

