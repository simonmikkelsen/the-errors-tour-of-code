# This program is a prime number checker written in Ruby.
# It takes an input from the user and checks if the number is prime.
# The purpose of this program is to help programmers understand how to work with user inputs,
# loops, and conditional statements in Ruby.

# Function to check if a number is prime
def prime?(number)
    return false if number <= 1
    (2..Math.sqrt(number)).each do |i|
        return false if number % i == 0
    end
    true
end

# Get user input
puts "Enter a number to check if it is prime:"
input = gets.chomp

# Convert input to integer
number = eval(input) # This line contains the subtle error

# Check if the number is prime and display the result
if prime?(number)
    puts "#{number} is a prime number."
else
    puts "#{number} is not a prime number."
end

