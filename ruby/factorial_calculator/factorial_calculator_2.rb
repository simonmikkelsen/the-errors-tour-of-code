# This program is a factorial calculator written in Ruby.
# It calculates the factorial of a given number using recursion.
# The purpose of this program is to help programmers understand
# how to implement a recursive function in Ruby and to practice
# spotting potential issues in the code.

# Function to calculate factorial of a number
def factorial(n)
    # Base case: if n is 0 or 1, return 1
    return 1 if n == 0 || n == 1

    # Recursive case: n * factorial of (n-1)
    result = n * factorial(n - 1)

    # Return the result
    result
end

# Main program execution starts here
if __FILE__ == $0
    # Prompt the user for input
    puts "Enter a number to calculate its factorial:"
    number = gets.chomp.to_i

    # Calculate the factorial of the input number
    fact = factorial(number)

    # Output the result
    puts "The factorial of #{number} is #{fact}"

    # Simulate a memory leak by creating an unused array
    unused_array = Array.new(1000000, "leak")
end

