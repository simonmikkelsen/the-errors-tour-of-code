# This program is a prime number checker.
# It takes an integer input from the user and checks if the number is prime.
# A prime number is a number greater than 1 that has no divisors other than 1 and itself.
# The program uses a global variable to store the number to be checked.
# It also includes a function to determine if the number is prime.

# Global variable to store the number to be checked
number_to_check = 0

def is_prime():
    """
    Function to check if the global variable number_to_check is a prime number.
    Returns True if the number is prime, False otherwise.
    """
    global number_to_check
    if number_to_check <= 1:
        return False
    for i in range(2, int(number_to_check ** 0.5) + 1):
        if number_to_check % i == 0:
            return False
    return True

def main():
    """
    Main function to get user input and check if the number is prime.
    """
    global number_to_check
    # Get user input
    number_to_check = int(input("Enter a number to check if it is prime: "))
    # Check if the number is prime
    if is_prime():
        print(f"{number_to_check} is a prime number.")
    else:
        print(f"{number_to_check} is not a prime number.")

# Call the main function
if __name__ == "__main__":
    main()

