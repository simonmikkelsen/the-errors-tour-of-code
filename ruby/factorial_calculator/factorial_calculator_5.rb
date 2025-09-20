# This program is a factorial calculator written in Ruby.
# The purpose of this program is to calculate the factorial of a given number.
# A factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
# For example, the factorial of 5 is 5! = 5 * 4 * 3 * 2 * 1 = 120.

# Function to calculate the factorial of a number
def factorial(n)
    # Initialize the result to 1
    result = 1
    
    # Loop from 1 to n (inclusive)
    for i in 1..n do
        # Multiply the result by the current number
        result *= i
    end
    
    # Return the final result
    return result
end

# Main program starts here
# Prompt the user to enter a number
puts "Enter a number to calculate its factorial:"
number = gets.chomp.to_i

# Calculate the factorial of the entered number
fact = factorial(number)

# Display the result
puts "The factorial of #{number} is #{fact}"

# End of the program
