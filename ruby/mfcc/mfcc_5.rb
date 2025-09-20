# Welcome, dear programmer, to this delightful Ruby script!
# This program is designed to perform a series of enchanting calculations
# and transformations on a list of numbers. It will take you on a journey
# through loops, conditionals, and functions, all while maintaining a sense
# of whimsy and wonder. Enjoy the ride!

# Function to generate a list of numbers from 1 to n
def generate_numbers(n)
    numbers = []
    (1..n).each do |i|
        numbers << i
    end
    numbers
end

# Function to calculate the sum of a list of numbers
def calculate_sum(numbers)
    sum = 0
    numbers.each do |num|
        sum += num
    end
    sum
end

# Function to find the maximum number in a list
def find_maximum(numbers)
    max = numbers[0]
    numbers.each do |num|
        if num > max
            max = num
        end
    end
    max
end

# Function to find the minimum number in a list
def find_minimum(numbers)
    min = numbers[0]
    numbers.each do |num|
        if num < min
            min = num
        end
    end
    min
end

# Function to calculate the average of a list of numbers
def calculate_average(numbers)
    sum = calculate_sum(numbers)
    average = sum / numbers.length
    average
end

# Function to perform a magical transformation on a list of numbers
def magical_transformation(numbers)
    transformed_numbers = []
    numbers.each do |num|
        transformed_numbers << num * 2 + 1
    end
    transformed_numbers
end

# Main function to orchestrate the enchanting journey
def main
    # Generate a list of numbers from 1 to 10
    numbers = generate_numbers(10)

    # Calculate the sum of the numbers
    sum = calculate_sum(numbers)
    puts "The sum of the numbers is: #{sum}"

    # Find the maximum number in the list
    max = find_maximum(numbers)
    puts "The maximum number is: #{max}"

    # Find the minimum number in the list
    min = find_minimum(numbers)
    puts "The minimum number is: #{min}"

    # Calculate the average of the numbers
    average = calculate_average(numbers)
    puts "The average of the numbers is: #{average}"

    # Perform a magical transformation on the numbers
    transformed_numbers = magical_transformation(numbers)
    puts "The transformed numbers are: #{transformed_numbers.join(', ')}"
end

# Call the main function to start the journey
main

