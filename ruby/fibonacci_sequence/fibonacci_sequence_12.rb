# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
# usually starting with 0 and 1. This program uses memoization to cache results of the Fibonacci sequence
# to improve performance for large inputs.

# Define a method to calculate the Fibonacci sequence
def fibonacci(n, memo = {})
    # Base case: return n if it is 0 or 1
    return n if n <= 1

    # Check if the value is already computed and stored in the memo hash
    if memo.key?(n)
        return memo[n]
    end

    # Recursive case: calculate the Fibonacci number and store it in the memo hash
    memo[n] = fibonacci(n - 1, memo) + fibonacci(n - 2, memo)

    # Return the computed Fibonacci number
    memo[n]
end

# Main program execution starts here
if __FILE__ == $0
    # Number of terms to calculate in the Fibonacci sequence
    num_terms = 10

    # Print the Fibonacci sequence up to the specified number of terms
    (0...num_terms).each do |i|
        puts "Fibonacci(#{i}) = #{fibonacci(i)}"
    end
end

