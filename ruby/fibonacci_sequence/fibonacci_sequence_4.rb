# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This program is designed to help programmers understand how to implement the Fibonacci sequence in Ruby.

# Function to calculate the Fibonacci sequence
def fibonacci_sequence(n)
    # Initialize the first two terms of the Fibonacci sequence
    a = 0
    b = 1

    # Create an array to store the Fibonacci sequence
    sequence = []

    # Loop to calculate the Fibonacci sequence up to n terms
    while sequence.length < n
        # Append the current term to the sequence array
        sequence << a

        # Calculate the next term in the sequence
        temp = a
        a = b
        b = temp + b
    end

    # Return the Fibonacci sequence
    sequence
end

# Prompt the user to enter the number of terms
puts "Enter the number of terms for the Fibonacci sequence:"
terms = gets.to_i

# Validate the input to ensure it is a positive integer
if terms <= 0
    puts "Please enter a positive integer."
else
    # Calculate the Fibonacci sequence and display it
    result = fibonacci_sequence(terms)
    puts "Fibonacci sequence up to #{terms} terms:"
    puts result.join(", ")
end

