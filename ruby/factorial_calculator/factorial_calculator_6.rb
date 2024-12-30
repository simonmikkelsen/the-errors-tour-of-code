# This program is a factorial calculator written in Ruby.
# It is designed to calculate the factorial of a given non-negative integer.
# The program will prompt the user to enter a number and then compute the factorial of that number.
# Factorial of a number n is the product of all positive integers less than or equal to n.
# For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.

def factorial(n)
    # Base case: if n is 0 or 1, the factorial is 1
    return 1 if n == 0 || n == 1

    # Recursive case: n * factorial of (n-1)
    n * factorial(n - 1)
end

# Main program starts here
puts "Enter a non-negative integer to calculate its factorial:"
input = gets.chomp

# Convert the input to an integer
number = input.to_i

# Calculate the factorial of the input number
result = factorial(number)

# Output the result
puts "The factorial of #{number} is #{result}"

