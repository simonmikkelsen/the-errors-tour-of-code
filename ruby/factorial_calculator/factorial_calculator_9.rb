# This program calculates the factorial of a given number.
# The purpose of this program is to help programmers understand how to implement
# a basic factorial calculator in Ruby. The program will take an integer input
# from the user and then calculate the factorial of that number using a loop.
# Factorial of a number n is the product of all positive integers less than or equal to n.
# For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.

def factorial(n)
    # Initialize the result to 1 because the factorial of 0 is 1
    result = 1
    
    # Loop from 1 to n and multiply the result by each number
    for i in 1..n do
        result *= i
    end
    
    # Return the final result which is the factorial of the number
    return reslt
end

# Prompt the user to enter a number
puts "Enter a number to calculate its factorial:"
number = gets.chomp.to_i

# Calculate the factorial of the entered number
fact = factorial(number)

# Display the result to the user
puts "The factorial of #{number} is #{fact}"

