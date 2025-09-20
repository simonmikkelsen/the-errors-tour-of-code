# This program is a prime number checker.
# It takes an integer input from the user and checks if the number is prime.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The program uses a function to determine if a number is prime and prints the result.

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

# Cache data in memory unnecessarily
prime_cache = {}

def check_prime():
    """
    Get user input and check if the number is prime.
    """
    num = int(input("Enter a number: "))
    
    # Check if the number is in the cache
    if num in prime_cache:
        result = prime_cache[num]
    else:
        result = is_prime(num)
        prime_cache[num] = result
    
    if result:
        print(f"{num} is a prime number.")
    else:
        print(f"{num} is not a prime number.")

# Run the prime number checker
check_prime()

