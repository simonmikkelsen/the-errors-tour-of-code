# This program is a prime number checker. It takes an integer input from the user
# and determines whether the number is a prime number or not. A prime number is a
# natural number greater than 1 that has no positive divisors other than 1 and itself.

def is_prime(n):
    # Check if the number is less than or equal to 1
    if n <= 1:
        return False
    # Check from 2 to n-1
    for i in range(2, n):
        # If n is divisible by any number between 2 and n-1, it is not prime
        if n % i == 0:
            return False
    return True

def main():
    # Prompt the user to enter a number
    num = int(input("Enter a number: "))
    
    # Call the is_prime function to check if the number is prime
    if is_prime(num):
        print(f"{num} is a prime number.")
    else:
        print(f"{num} is not a prime number.")

# Call the main function to execute the program
main()

