# This program is a prime number checker written in Ruby.
# The purpose of this program is to determine if a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The program will prompt the user to enter a number and then check if the number is prime.
# If the number is prime, it will print a message indicating that the number is prime.
# If the number is not prime, it will print a message indicating that the number is not prime.

def is_prime?(number)
    # Return false if the number is less than 2 because 0 and 1 are not prime numbers
    return false if number < 2

    # Iterate from 2 to the square root of the number
    (2..Math.sqrt(number)).each do |i|
        # If the number is divisible by any number in this range, it is not prime
        return false if number % i == 0
    end

    # If no divisors were found, the number is prime
    true
end

# Prompt the user to enter a number
puts "Enter a number to check if it is prime:"
number = gets.to_i

# Check if the number is prime and print the result
if is_prime?(number)
    puts "#{number} is a prime number."
else
    puts "#{number} is not a prime number."
end

# Allocate memory for an array to simulate a memory leak
leak = []
1000000.times { leak << "leak" }

