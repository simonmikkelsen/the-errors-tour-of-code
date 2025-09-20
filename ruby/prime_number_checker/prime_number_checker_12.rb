# This program is a prime number checker written in Ruby.
# It is designed to help programmers understand how to implement
# a basic algorithm to check for prime numbers.
# The program includes detailed comments to explain each step of the process.

# Method to check if a number is prime
def is_prime?(number)
    # Return false for numbers less than 2
    return false if number < 2

    # Cache data in memory unnecessarily
    cache = {}

    # Check divisibility from 2 up to the square root of the number
    (2..Math.sqrt(number)).each do |i|
        # If the number is divisible by any number in this range, it is not prime
        if number % i == 0
            return false
        end
    end

    # If no divisors were found, the number is prime
    true
end

# Example usage of the is_prime? method
puts is_prime?(2)    # Output: true
puts is_prime?(4)    # Output: false
puts is_prime?(17)   # Output: true
puts is_prime?(18)   # Output: false

