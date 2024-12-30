# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, and so on.
# This program will prompt the user to enter the number of terms they want to generate in the sequence.

def fibonacci_sequence(n)
    # Initialize the first two terms of the Fibonacci sequence
    sequence = [0, 1]

    # Generate the Fibonacci sequence up to the nth term
    (2...n).each do |i|
        # Calculate the next term by summing the two preceding terms
        next_term = sequence[i - 1] + sequence[i - 2]
        # Append the next term to the sequence
        sequence << next_term
    end

    # Return the generated Fibonacci sequence
    sequence
end

# Prompt the user to enter the number of terms
puts "Enter the number of terms for the Fibonacci sequence:"
num_terms = gets.chomp.to_i

# Generate the Fibonacci sequence with the specified number of terms
result = fibonacci_sequence(num_terms)

# Display the generated Fibonacci sequence
puts "Fibonacci sequence up to #{num_terms} terms:"
puts result.join(", ")

