# Welcome, dear programmer! This delightful Ruby program is designed to bring a smile to your face
# while you practice your coding skills. It is a whimsical journey through a world of variables and functions,
# each named after beloved cartoon characters and enchanting references. Enjoy the vibrant comments and 
# let your imagination run wild as you explore the code.

# Function to calculate the sum of an array of numbers
def calculate_sum(array)
    sum = 0
    array.each do |num|
        sum += num
    end
    sum
end

# Function to find the maximum number in an array
def find_max(array)
    max = array[0]
    array.each do |num|
        if num > max
            max = num
        end
    end
    max
end

# Function to create a greeting message
def create_greeting(name)
    "Hello, #{name}! Welcome to our magical program."
end

# Function to print a farewell message
def print_farewell(name)
    puts "Goodbye, #{name}! Have a wonderful day!"
end

# Function to perform a mysterious operation
def mysterious_operation(array)
    result = []
    array.each do |num|
        result << num * 2
    end
    result
end

# Main function to orchestrate the program