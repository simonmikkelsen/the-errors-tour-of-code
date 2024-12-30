# This program is a prime number checker written in Ruby.
# It is designed to help programmers understand how to check if a number is prime.
# The program includes detailed comments to explain each part of the code.

# Function to check if a number is prime
def prime?(number)
    # Return false if the number is less than 2, as 0 and 1 are not prime numbers
    return false if number < 2

    # Loop from 2 to the square root of the number
    (2..Math.sqrt(number)).each do |i|
        # If the number is divisible by any number in this range, it is not prime
        return false if number % i == 0
    end

    # If no divisors were found, the number is prime
    true
end

# Main program starts here
puts "Enter a number to check if it is prime:"
input = gets.chomp.to_i

# Call the prime? function and store the result in a variable
result = prime?(input)

# Print the result
if result
    puts "#{input} is a prime number."
else
    puts "#{input} is not a prime number."
end

