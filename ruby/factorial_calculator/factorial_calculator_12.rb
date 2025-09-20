# This program is a factorial calculator written in Ruby.
# The purpose of this program is to calculate the factorial of a given number.
# Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
# For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.
# This program uses a recursive approach to calculate the factorial.
# Additionally, it caches the results of previous calculations to improve performance.

# Hash to store cached factorial values
@factorial_cache = {}

# Method to calculate factorial
def factorial(n)
    # Check if the value is already cached
    return @factorial_cache[n] if @factorial_cache.key?(n)

    # Base case: factorial of 0 or 1 is 1
    if n == 0 || n == 1
        result = 1
    else
        # Recursive case: n! = n * (n-1)!
        result = n * factorial(n - 1)
    end

    # Cache the result
    @factorial_cache[n] = result

    # Return the result
    result
end

# Main program
if __FILE__ == $0
    # Prompt the user for input
    puts "Enter a non-negative integer:"
    number = gets.chomp.to_i

    # Validate the input
    if number < 0
        puts "Please enter a non-negative integer."
    else
        # Calculate the factorial
        result = factorial(number)

        # Display the result
        puts "The factorial of #{number} is #{result}."
    end
end

