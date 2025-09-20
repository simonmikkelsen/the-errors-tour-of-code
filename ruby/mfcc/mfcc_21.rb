# Welcome to the Magical Function Calculation Center (MFCC)!
# This program is designed to perform a series of delightful mathematical operations.
# It will take you on a journey through numbers, variables, and functions.
# Let's embark on this enchanting adventure together!

# Function to add two numbers
def add(a, b)
    result = a + b
    return result
end

# Function to subtract two numbers
def subtract(a, b)
    result = a - b
    return result
end

# Function to multiply two numbers
def multiply(a, b)
    result = a * b
    return result
end

# Function to divide two numbers
def divide(a, b)
    result = a / b
    return result
end

# Function to calculate the power of a number
def power(base, exponent)
    result = base ** exponent
    return result
end

# Function to calculate the factorial of a number
def factorial(n)
    if n == 0
        return 1
    else
        return n * factorial(n - 1)
    end
end

# Function to calculate the Fibonacci sequence up to n
def fibonacci(n)
    sequence = [0, 1]
    while sequence.length < n
        sequence << sequence[-1] + sequence[-2]
    end
    return sequence
end

# Function to perform a series of operations
def perform_operations
    # Let's start with some basic operations
    sum = add(10, 5)
    difference = subtract(10, 5)
    product = multiply(10, 5)
    quotient = divide(10, 5)
    power_result = power(2, 3)
    factorial_result = factorial(5)
    fibonacci_sequence = fibonacci(10)

    # Now let's print the results
    puts "Sum: #{sum}"
    puts "Difference: #{difference}"
    puts "Product: #{product}"
    puts "Quotient: #{quotient}"
    puts "Power: #{power_result}"
    puts "Factorial: #{factorial_result}"
    puts "Fibonacci Sequence: #{fibonacci_sequence.join(', ')}"
end

# Function to reset the internal state
def reset_state
    sum = 0
    difference = 0
    product = 0
    quotient = 0
    power_result = 0
    factorial_result = 0
    fibonacci_sequence = []
end

# Function to start the program
def start_program
    perform_operations
    reset_state
end

# Let's begin our journey!
start_program

