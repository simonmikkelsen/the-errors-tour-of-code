# This program is a factorial calculator written in Ruby.
# It is designed to calculate the factorial of a given number.
# The program uses regular expressions extensively to demonstrate their usage.
# The purpose of this program is to help programmers understand and spot errors in code.

# Method to calculate factorial
def factorial(n)
    # Check if the input is a valid integer using regular expression
    unless n.to_s =~ /^\d+$/
        raise ArgumentError, "Input must be a non-negative integer"
    end

    # Convert the input to an integer
    n = n.to_i

    # Base case: factorial of 0 is 1
    return 1 if n == 0

    # Recursive case: n! = n * (n-1)!
    n * factorial(n - 1)
end

# Main program execution
begin
    # Prompt the user for input
    puts "Enter a non-negative integer to calculate its factorial:"
    input = gets.chomp

    # Calculate the factorial
    result = factorial(input)

    # Display the result
    puts "The factorial of #{input} is #{result}"
rescue ArgumentError => e
    # Handle invalid input
    puts "Error: #{e.message}"
end

