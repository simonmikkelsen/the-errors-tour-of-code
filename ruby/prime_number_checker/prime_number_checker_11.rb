# This program is a prime number checker written in Ruby.
# It is designed to help programmers understand how to use regular expressions
# and to spot subtle errors in code. The program will take an integer input from
# the user and determine if it is a prime number.

# Method to check if a number is prime
def prime_number_checker(number)
    # Regular expression to match any digit
    digit_regex = /\d/

    # Return false if number is less than 2 (not prime)
    return false if number < 2

    # Loop from 2 to the square root of the number
    (2..Math.sqrt(number)).each do |i|
        # Check if the number is divisible by i
        if number % i == 0
            return false
        end
    end

    # If no divisors were found, the number is prime
    true
end

# Main program execution
puts "Enter a number to check if it is prime:"
input = gets.chomp

# Validate input using regular expression
if input =~ /^\d+$/
    number = input.to_i
    if prime_number_checker(number)
        puts "#{number} is a prime number."
    else
        puts "#{number} is not a prime number."
    end
else
    puts "Invalid input. Please enter a valid integer."
end

