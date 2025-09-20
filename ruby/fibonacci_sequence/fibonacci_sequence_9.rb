# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This program is designed to help programmers understand the implementation of the Fibonacci sequence in Ruby.

def fibonacci_sequence(n)
    # Initialize the first two terms of the Fibonacci sequence
    sequence = [0, 1]

    # Generate the Fibonacci sequence up to the nth term
    (2..n).each do |i|
        # Calculate the next term by adding the previous two terms
        next_term = sequence[i - 1] + sequence[i - 2]
        # Append the next term to the sequence
        sequence << next_term
    end

    # Return the generated Fibonacci sequence
    return sequence
end

# Prompt the user to enter the number of terms for the Fibonacci sequence
puts "Enter the number of terms for the Fibonacci sequence:"
num_terms = gets.chomp.to_i

# Call the fibonacci_sequence function and store the result
result = fibonacci_sequence(num_terms)

# Display the generated Fibonacci sequence
puts "The Fibonacci sequence up to #{num_terms} terms is:"
puts result.join(", ")

