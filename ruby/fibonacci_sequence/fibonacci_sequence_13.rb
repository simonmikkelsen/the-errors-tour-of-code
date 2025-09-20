# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This program uses a global variable to store the sequence and demonstrates how to generate the sequence.

# Global variable to store the Fibonacci sequence
$fibonacci_sequence = []

# Function to generate the Fibonacci sequence
def generate_fibonacci(n)
    # Initialize the first two terms of the sequence
    $fibonacci_sequence[0] = 0
    $fibonacci_sequence[1] = 1

    # Generate the remaining terms of the sequence
    (2...n).each do |i|
        $fibonacci_sequence[i] = $fibonacci_sequence[i - 1] + $fibonacci_sequence[i - 2]
    end
end

# Function to print the Fibonacci sequence
def print_fibonacci
    # Print each term of the sequence
    $fibonacci_sequence.each do |term|
        puts term
    end
end

# Main program
# Number of terms to generate in the Fibonacci sequence
num_terms = 10

# Generate the Fibonacci sequence
generate_fibonacci(num_terms)

# Print the Fibonacci sequence
print_fibonacci

