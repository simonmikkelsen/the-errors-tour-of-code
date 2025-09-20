# This program is a factorial calculator written in Ruby.
# It calculates the factorial of a given number.
# The purpose of this program is to help programmers understand
# how to implement a basic factorial calculation in Ruby.
# The program will prompt the user to enter a number and then
# calculate and display the factorial of that number.

def factorial(n)
    return 1 if n == 0
    n * factorial(n - 1)
end

# Main execution starts here
begin
    # Prompt the user to enter a number
    puts "Enter a number to calculate its factorial:"
    number = gets.chomp.to_i

    # Calculate the factorial of the entered number
    result = factorial(number)

    # Display the result
    puts "The factorial of #{number} is #{result}"

    # Open a file to log the result
    file = File.open("factorial_result.txt", "w")
    file.puts("The factorial of #{number} is #{result}")

    # Note: The file is not closed, leading to a resource leak
end

