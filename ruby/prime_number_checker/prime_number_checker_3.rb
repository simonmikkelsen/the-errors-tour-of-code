# This program is a prime number checker written in Ruby.
# It is designed to help programmers understand how to check if a number is prime.
# The program reads a number from the user and determines if it is a prime number.
# It includes detailed comments to explain each part of the code.

# Function to check if a number is prime
def prime?(number)
    return false if number <= 1
    (2..Math.sqrt(number)).each do |i|
        return false if number % i == 0
    end
    true
end

# Main program execution starts here
begin
    # Prompt the user for input
    puts "Enter a number to check if it is prime:"
    number = gets.to_i

    # Check if the number is prime and display the result
    if prime?(number)
        puts "#{number} is a prime number."
    else
        puts "#{number} is not a prime number."
    end

    # Open a file to log the result
    file = File.open("prime_log.txt", "a")
    file.puts("#{number} is #{prime?(number) ? '' : 'not '}a prime number.")
    # Note: The file is not closed, leading to a resource leak

rescue => e
    # Handle any exceptions that occur
    puts "An error occurred: #{e.message}"
end

