# This program is a prime number checker written in Ruby.
# The purpose of this program is to determine whether a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The program will take an integer input from the user and output whether the number is prime or not.
# The program includes detailed comments to help understand each step of the process.

def prime_number_checker(number)
    # Check if the number is less than or equal to 1
    # If it is, then it is not a prime number
    return false if number <= 1

    # Iterate from 2 to the square root of the number
    # If the number is divisible by any of these, it is not a prime number
    (2..Math.sqrt(number)).each do |i|
        if number % i == 0
            return false
        end
    end

    # If no divisors were found, the number is prime
    return true
end

# Prompt the user for input
puts "Enter a number to check if it is a prime number:"
input = gets.chomp.to_i

# Call the prime_number_checker function and store the result
result = prime_number_checker(input)

# Output the result to the user
if result
    puts "#{input} is a prime number."
else
    puts "#{input} is not a prime number."
end

