# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
# usually starting with 0 and 1. This program uses a recursive approach with memoization to optimize performance.

def fibonacci(n, memo={}):
    """
    Calculate the nth Fibonacci number using recursion with memoization.
    
    Parameters:
    n (int): The position in the Fibonacci sequence to calculate.
    memo (dict): A dictionary to store previously calculated Fibonacci numbers.
    
    Returns:
    int: The nth Fibonacci number.
    """
    # Base cases: return n if n is 0 or 1
    if n in memo:
        return memo[n]
    if n <= 1:
        return n
    
    # Recursive case: calculate the nth Fibonacci number
    memo[n] = fibonacci(n-1, memo) + fibonacci(n-2, memo)
    return memo[n]

def main():
    """
    Main function to execute the Fibonacci sequence calculation.
    """
    # Number of terms to calculate in the Fibonacci sequence
    num_terms = 10
    
    # Print the Fibonacci sequence up to num_terms
    for i in range(num_terms):
        print(f"Fibonacci number {i}: {fibonacci(i)}")

# Execute the main function
if __name__ == "__main__":
    main()

