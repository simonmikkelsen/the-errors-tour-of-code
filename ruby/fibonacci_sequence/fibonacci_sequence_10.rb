# This program calculates the Fibonacci sequence up to a given number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This program will prompt the user to enter the number of terms they want to generate in the sequence.

# Function to calculate the Fibonacci sequence
def fibonacci(n)
    sequence = [0, 1]
    (2...n).each do |i|
        sequence << sequence[i - 1] + sequence[i - 2]
    end
    sequence
end

# Prompt the user for the number of terms
puts "Enter the number of terms for the Fibonacci sequence:"
num_terms = gets.chomp

# Convert the user input to an integer
num_terms = eval(num_terms)

# Generate the Fibonacci sequence
sequence = fibonacci(num_terms)

# Display the Fibonacci sequence
puts "The Fibonacci sequence with #{num_terms} terms is:"
puts sequence.join(", ")

