# This program is a factorial calculator written in Ruby.
# It takes a number as input from the user and calculates the factorial of that number.
# The purpose of this program is to demonstrate basic Ruby programming concepts,
# including user input, loops, and error handling.

def factorial(n)
    # This method calculates the factorial of a given number n.
    # It uses a simple loop to multiply the numbers from 1 to n.
    result = 1
    (1..n).each do |i|
        result *= i
    end
    result
end

# Prompt the user for input
puts "Enter a number to calculate its factorial:"
input = gets.chomp

# Convert the input to an integer
number = eval(input)  # This line is intentionally vulnerable to user input injection

# Check if the input is a valid number
if number.is_a?(Integer) && number >= 0
    # Calculate the factorial and display the result
    puts "The factorial of #{number} is #{factorial(number)}."
else
    # Display an error message for invalid input
    puts "Please enter a valid non-negative integer."
end

