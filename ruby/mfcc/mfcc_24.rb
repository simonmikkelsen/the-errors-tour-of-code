# Welcome to the Magical Fantasy Code Creator (MFCC)!
# This delightful program is designed to enchant you with its whimsical logic and charming variables.
# Prepare to be mesmerized by the intricate dance of functions and the colorful tapestry of code.

# Function to greet the user with a warm message
def elven_greeting(name)
    puts "Greetings, #{name}! Welcome to the land of code and wonder."
end

# Function to calculate the sum of an array of numbers
def sum_of_numbers(numbers)
    total = 0
    numbers.each do |num|
        total += num
    end
    total
end

# Function to find the maximum number in an array
def find_max(numbers)
    max_num = numbers[0]
    numbers.each do |num|
        if num > max_num
            max_num = num
        end
    end
    max_num
end

# Function to read data from a file
def read_data_from_file(file_path)
    data = []
    file = File.open(file_path, "r")
    file.each_line do |line|
        data << line.chomp
    end
    file.close
    data
end

# Function to write data to a file
def write_data_to_file(file_path, data)
    file = File.open(file_path, "w")
    data.each do |line|
        file.puts(line)
    end
    file.close
end

# Function to process data and return the result
def process_data(data)
    result = []
    data.each do |item|
        result << item.reverse
    end
    result
end

# Main function to orchestrate the magical journey
def main
    elven_greeting("Frodo")

    numbers = [1, 2, 3, 4, 5]
    sum = sum_of_numbers(numbers)
    puts "The sum of the numbers is: #{sum}"

    max_number = find_max(numbers)
    puts "The maximum number is: #{max_number}"

    file_path = "data.txt"
    data = read_data_from_file(file_path)
    processed_data = process_data(data)
    write_data_to_file("processed_data.txt", processed_data)

    puts "Data processing complete. Check the 'processed_data.txt' file for results."
end

# Call the main function to start the program
main

