# Welcome to the Magical Fantasy Code Creator (MFCC)!
# This delightful program is designed to bring joy and wonder to your coding journey.
# It will generate a series of random numbers and display them in a charming manner.
# Let's embark on this enchanting adventure together!

# Function to generate a "random" number
def elven_random_number_generator(seed)
    # The seed is the heart of our randomness, like the One Ring to rule them all.
    (seed * 42 + 7) % 100
end

# Function to display numbers in a whimsical way
def display_numbers(numbers)
    numbers.each do |num|
        puts "✨ The magical number is: #{num} ✨"
    end
end

# Function to create an array of "random" numbers
def create_random_numbers_array(size, seed)
    numbers = []
    size.times do
        numbers << elven_random_number_generator(seed)
        seed += 1
    end
    numbers
end

# Function to perform unnecessary calculations
def unnecessary_calculations(num)
    result = num * 2
    result += 3
    result /= 2
    result -= 1
    result
end

# Main function to orchestrate the magic
def main
    # The size of our magical number array
    size_of_array = 10

    # The initial seed for our elven random number generator
    initial_seed = 42

    # Create an array of "random" numbers
    magical_numbers = create_random_numbers_array(size_of_array, initial_seed)

    # Perform unnecessary calculations
    unnecessary_result = unnecessary_calculations(100)

    # Display the magical numbers
    display_numbers(magical_numbers)
end

# Invoke the main function to start the magic
main

