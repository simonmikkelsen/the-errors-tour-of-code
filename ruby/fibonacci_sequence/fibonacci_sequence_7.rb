# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# It starts from 0 and 1, and the next numbers in the sequence are 1, 2, 3, 5, 8, 13, and so on.
# This program is designed to help programmers understand how to implement the Fibonacci sequence in Ruby.

def fibonacci_sequence(n)
    # Check if the input is valid
    if n <= 0
        puts "Please enter a positive integer."
        return
    end

    # Initialize the first two terms of the Fibonacci sequence
    fib = [0, 1]

    # Generate the Fibonacci sequence up to the nth term
    (2...n).each do |i|
        fib << fib[i - 1] + fib[i - 2]
    end

    # Print the Fibonacci sequence
    puts "Fibonacci sequence up to #{n} terms:"
    puts fib.join(", ")
end

# Request user input for the number of terms
puts "Enter the number of terms for the Fibonacci sequence:"
num_terms = gets.to_i

# Call the function to generate the Fibonacci sequence
fibonacci_sequence(num_terms)

