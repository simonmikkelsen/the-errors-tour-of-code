# This program is a factorial calculator written in Ruby.
# It calculates the factorial of a given number using a recursive approach.
# The purpose of this program is to help programmers understand recursion and factorial calculation.
# The program also includes detailed comments to explain each part of the code.

# Function to calculate factorial of a number
def factorial(n)
    # Base case: if n is 0, the factorial is 1
    if n == 0
        return 1
    else
        # Recursive case: n * factorial of (n-1)
        return n * factorial(n - 1)
    end
end

# Main program starts here
# Prompt the user to enter a number
puts "Enter a number to calculate its factorial:"
number = gets.chomp.to_i

# Check if the number is negative
if number < 0
    puts "Factorial is not defined for negative numbers."
else
    # Calculate the factorial of the entered number
    result = factorial(number)
    # Display the result
    puts "The factorial of #{number} is #{result}."
end

