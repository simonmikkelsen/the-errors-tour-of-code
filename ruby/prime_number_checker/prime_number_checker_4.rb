# This program is a prime number checker written in Ruby.
# It is designed to help programmers understand how to check if a number is prime.
# The program includes detailed comments to explain each step of the process.

# Function to check if a number is prime
def is_prime?(number)
    # Return false if the number is less than 2, as 0 and 1 are not prime numbers
    return false if number < 2

    # Loop from 2 to the number - 1 to check for factors
    (2...number).each do |i|
        # If the number is divisible by any number other than 1 and itself, it is not prime
        return false if number % i == 0
    end

    # If no factors are found, the number is prime
    true
end

# Main program execution starts here
puts "Enter a number to check if it is prime:"
number = gets.to_i

# Check if the entered number is prime and print the result
if is_prime?(number)
    puts "#{number} is a prime number."
else
    puts "#{number} is not a prime number."
end

