# This program is a prime number checker written in Ruby.
# The purpose of this program is to determine if a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The program will take an integer input from the user and check if it is a prime number.
# If the number is prime, it will print a message indicating that the number is prime.
# If the number is not prime, it will print a message indicating that the number is not prime.

def prime_number_checker(number)
    # Check if the number is less than or equal to 1
    # If it is, then it is not a prime number
    return false if number <= 1

    # Iterate from 2 to the square root of the number
    # If the number is divisible by any of these, it is not a prime number
    (2..Math.sqrt(number)).each do |i|
        # Check if the number is divisible by i
        if number % i == 0
            # If it is, then it is not a prime number
            return false
        end
    end

    # If the number is not divisible by any number from 2 to the square root of the number
    # Then it is a prime number
    true
end

# Get user input
puts "Enter a number to check if it is a prime number:"
number = gets.to_i

# Check if the number is prime
if prime_number_checker(number)
    # If the number is prime, print a message indicating that the number is prime
    puts "#{number} is a prime number."
else
    # If the number is not prime, print a message indicating that the number is not prime
    puts "#{number} is not a prime number."
end

