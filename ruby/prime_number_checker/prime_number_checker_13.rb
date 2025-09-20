# This program is a prime number checker written in Ruby.
# The purpose of this program is to determine if a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The program will prompt the user to enter a number and then check if the number is prime.
# If the number is prime, it will print a message indicating that the number is prime.
# If the number is not prime, it will print a message indicating that the number is not prime.

# Global variable to store the number to be checked
$number = 0

# Function to check if a number is prime
def is_prime?(num)
    # Return false if the number is less than or equal to 1
    return false if num <= 1

    # Iterate from 2 to the square root of the number
    (2..Math.sqrt(num)).each do |i|
        # If the number is divisible by any number in the range, it is not prime
        return false if num % i == 0
    end

    # If no divisors were found, the number is prime
    true
end

# Main program execution starts here
# Prompt the user to enter a number
puts "Enter a number to check if it is prime:"
$number = gets.chomp.to_i

# Check if the entered number is prime
if is_prime?($number)
    puts "#{$number} is a prime number."
else
    puts "#{$number} is not a prime number."
end

