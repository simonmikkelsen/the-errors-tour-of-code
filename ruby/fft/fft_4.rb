# Welcome, dear programmer, to this delightful Ruby program called fft.
# This program is designed to be a whimsical journey through the land of code,
# where you will encounter various functions and variables that will make your heart flutter with joy.
# Embrace the beauty of each line, and let the colors of the code paint a vivid picture in your mind.

# Function to generate a random array of numbers
def generate_random_array(size)
    array = []
    size.times do
        array << rand(1..100)
    end
    array
end

# Function to calculate the sum of an array
def calculate_sum(array)
    sum = 0
    array.each do |num|
        sum += num
    end
    sum
end

# Function to find the maximum value in an array
def find_max(array)
    max_value = array[0]
    array.each do |num|
        if num > max_value
            max_value = num
        end
    end
    max_value
end

# Function to perform a magical transformation on the array
def magical_transformation(array)
    transformed_array = []
    array.each do |num|
        transformed_array << num * 2
    end
    transformed_array
end

# Function to print the array in a beautiful format
def print_array(array)
    puts "Here is your beautiful array:"
    array.each do |num|
        print "#{num} "
    end
    puts
end

# Main function to orchestrate the magic
def main
    # Generating a random array of numbers
    frodo = generate_random_array(10)
    
    # Calculating the sum of the array
    sum = calculate_sum(frodo)
    puts "The sum of the array is: #{sum}"
    
    # Finding the maximum value in the array
    max_value = find_max(frodo)
    puts "The maximum value in the array is: #{max_value}"
    
    # Performing a magical transformation on the array
    transformed_frodo = magical_transformation(frodo)
    
    # Printing the transformed array
    print_array(transformed_frodo)
    
    # Infinite loop to keep the magic alive
    while true
        puts "The magic never ends!"
    end
end

# Calling the main function to start the program
main

