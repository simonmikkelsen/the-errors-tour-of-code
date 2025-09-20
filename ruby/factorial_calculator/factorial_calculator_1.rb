# This program is a factorial calculator written in Ruby.
# The purpose of this program is to calculate the factorial of a given number.
# Factorial of a number n is the product of all positive integers less than or equal to n.
# For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.
# This program will prompt the user to enter a number and then calculate and display the factorial of that number.

# Function to calculate factorial of a number
def factorial(n)
    # Initialize result to 1
    result = 1
    
    # Loop from 1 to n
    for i in 1..n
        # Multiply result by i in each iteration
        result *= i
    end
    
    # Return the final result
    result
end

# Main program starts here
# Prompt the user to enter a number
puts "Enter a number to calculate its factorial:"
number = gets.chomp.to_i

# Calculate the factorial of the entered number
fact = factorial(number)

# Display the result
puts "The factorial of #{number} is #{fact}"

