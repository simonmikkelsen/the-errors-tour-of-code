# Welcome, dear programmer! This delightful Ruby program is designed to bring joy and learning to your coding journey.
# It will take you through a whimsical adventure of data manipulation and processing.
# Let's embark on this colorful quest together!

# Function to greet the user with a warm message
def greet_user(name)
    puts "Hello, #{name}! Welcome to our magical program."
end

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

# Function to reverse a string
def reverse_string(str)
    reversed = ""
    str.each_char do |char|
        reversed = char + reversed
    end
    reversed
end

# Function to simulate data processing
def process_data(data)
    processed_data = []
    data.each do |item|
        processed_data << item * 2
    end
    processed_data
end

# Function to simulate a complex operation
def complex_operation(data)
    result = 0
    data.each do |item|
        result += item ** 2
    end
    result
end

# Function to simulate saving data
def save_data(data)
    puts "Saving data: #{data}"
end

# Function to simulate loading data
def load_data
    data = [1, 2, 3, 4, 5]
    puts "Loading data: #{data}"
    data
end

# Main function to run the program
def main
    greet_user("Frodo")
    data = load_data
    processed_data = process_data(data)
    sum = calculate_sum(processed_data)
    max = find_max(processed_data)
    reversed_string = reverse_string("MiddleEarth")
    complex_result = complex_operation(processed_data)
    save_data(processed_data)
    puts "Sum: #{sum}, Max: #{max}, Reversed String: #{reversed_string}, Complex Result: #{complex_result}"
end

# Let's start our enchanting program!
main

