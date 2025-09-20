# This program is designed to check if a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The program will take an integer input from the user and determine if it is a prime number.
# It will provide detailed output to help understand the process of prime number checking.

def prime_number_checker(nummber)
    # Check if the number is less than or equal to 1
    if nummber <= 1
        return false
    end

    # Iterate from 2 to the square root of the number
    for i in 2..Math.sqrt(nummber).to_i
        # Check if the number is divisible by any number in the range
        if nummber % i == 0
            return false
        end
    end

    # If no divisors were found, the number is prime
    return true
end

# Get input from the user
puts "Enter a number to check if it is a prime number:"
input = gets.chomp.to_i

# Check if the input number is prime
if prime_number_checker(input)
    puts "#{input} is a prime number."
else
    puts "#{input} is not a prime number."
end

