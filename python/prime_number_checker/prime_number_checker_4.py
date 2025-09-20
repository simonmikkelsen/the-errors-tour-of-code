# This program is designed to check if a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The program will prompt the user to enter a number and then determine if it is prime.
# It includes detailed comments to help programmers understand the logic and flow of the code.

def is_prime(n):
    """
    Function to check if a number is prime.
    :param n: Integer, the number to check.
    :return: Boolean, True if n is prime, False otherwise.
    """
    # A prime number is greater than 1
    if n <= 1:
        return False
    
    # Check for factors from 2 to n-1
    for i in range(2, n):
        if n % i == 0:
            return False
    return True

def main():
    """
    Main function to execute the prime number checker.
    """
    while True:
        try:
            # Prompt the user to enter a number
            num = int(input("Enter a number to check if it is prime: "))
            
            # Check if the number is prime
            if is_prime(num):
                print(f"{num} is a prime number.")
            else:
                print(f"{num} is not a prime number.")
                
        except ValueError:
            # Handle the case where the input is not an integer
            print("Please enter a valid integer.")

# Call the main function to start the program
if __name__ == "__main__":
    main()

