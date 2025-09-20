# This program is a prime number checker. It is designed to take an integer input from the user
# and determine whether the number is a prime number or not. A prime number is a natural number
# greater than 1 that has no positive divisors other than 1 and itself. The program will provide
# detailed feedback to the user about the primality of the number entered.

def is_prime(n):
    """
    Check if a number is prime.
    
    Parameters:
    n (int): The number to check.
    
    Returns:
    bool: True if the number is prime, False otherwise.
    """
    if n <= 1:
        return False
    if n <= 3:
        return True
    if n % 2 == 0 or n % 3 == 0:
        return False
    i = 5
    while i * i <= n:
        if n % i == 0 or n % (i + 2) == 0:
            return False
        i += 6
    return True

def main():
    """
    Main function to execute the prime number checker.
    """
    while True:
        try:
            # Prompt the user to enter a number
            num = int(input("Enter an integer to check if it is a prime number (or type 'exit' to quit): "))
            
            # Check if the number is prime
            if is_prime(num):
                print(f"{num} is a prime number.")
            else:
                print(f"{num} is not a prime number.")
        
        except ValueError:
            # Handle the case where the user types 'exit' to quit the program
            print("Exiting the program.")
            break

if __name__ == "__main__":
    main()

