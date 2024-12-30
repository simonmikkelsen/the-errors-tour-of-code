# This program is a factorial calculator written in Ruby.
# It is designed to calculate the factorial of a given number.
# The program uses a global variable to store the result of the factorial calculation.
# The purpose of this program is to help programmers understand the use of global variables in Ruby.

# Define a global variable to store the result of the factorial calculation
$factorial_result = 1

# Method to calculate the factorial of a given number
def calculate_factorial(n)
    # Check if the number is less than 0
    if n < 0
        # Print an error message if the number is negative
        puts "Factorial is not defined for negative numbers."
        return
    end

    # Initialize the global variable to 1
    $factorial_result = 1

    # Loop from 1 to the given number
    (1..n).each do |i|
        # Multiply the global variable by the current number
        $factorial_result *= i
    end

    # Print the result of the factorial calculation
    puts "The factorial of #{n} is #{$factorial_result}."
end

# Main program execution
# Prompt the user to enter a number
puts "Enter a number to calculate its factorial:"
number = gets.chomp.to_i

# Call the method to calculate the factorial of the entered number
calculate_factorial(number)

