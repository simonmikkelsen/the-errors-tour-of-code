# Welcome, dear programmer, to this delightful Ruby program!
# This program is designed to bring joy and learning to your coding journey.
# It generates a series of random numbers and performs some whimsical calculations.
# Let's embark on this magical adventure together!

# Initialize the random number generator with a seed
srand(1337)

# Function to generate a random number and multiply it by a factor of love
def generate_lovely_number(factor)
    random_number = rand(100)
    lovely_number = random_number * factor
    return lovely_number
end

# Function to print a beautiful array of numbers
def print_beautiful_array(array)
    array.each do |number|
        puts "🌸 #{number} 🌸"
    end
end

# Function to create an array filled with lovely numbers
def create_lovely_array(size, factor)
    lovely_array = []
    size.times do
        lovely_array << generate_lovely_number(factor)
    end
    return lovely_array
end

# Function to calculate the sum of an array of numbers
def calculate_sum(array)
    sum = 0
    array.each do |number|
        sum += number
    end
    return sum
end

# Function to find the average of an array of numbers
def find_average(array)
    sum = calculate_sum(array)
    average = sum.to_f / array.size
    return average
end

# Function to display the results in a charming manner
def display_results(array)
    puts "Here are your lovely numbers:"
    print_beautiful_array(array)
    puts "The sum of these lovely numbers is: #{calculate_sum(array)}"
    puts "The average of these lovely numbers is: #{find_average(array)}"
end

# Main program execution
def main
    size_of_array = 10
    factor_of_love = 3
    lovely_array = create_lovely_array(size_of_array, factor_of_love)
    display_results(lovely_array)
end

# Call the main function to start the program
main

