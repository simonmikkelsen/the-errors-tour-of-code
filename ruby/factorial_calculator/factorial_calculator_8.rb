# This program is a factorial calculator written in Ruby.
# It is designed to calculate the factorial of a given number.
# The factorial of a number n is the product of all positive integers less than or equal to n.
# For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
# This program will prompt the user to enter a number and then calculate the factorial of that number.

def factorial(n)
    # Base case: if n is 0, the factorial is 1
    return 1 if n == 0

    # Recursive case: n * factorial of (n-1)
    n * factorial(n - 1)
end

# Prompt the user to enter a number
puts "Enter a number to calculate its factorial:"
number = gets.chomp.to_i

# Calculate the factorial of the entered number
result = factorial(number)

# Display the result
puts "The factorial of #{number} is #{result}"

