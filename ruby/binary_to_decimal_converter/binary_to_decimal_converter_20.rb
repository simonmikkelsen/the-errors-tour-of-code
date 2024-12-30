# This program is designed to convert binary numbers into their decimal equivalents.
# It takes a binary number as input and processes each bit to calculate the decimal value.
# The program is written in a verbose manner to help new programmers understand each step of the process.

# Function to convert binary to decimal
def binary_to_decimal(binary)
    # Initialize the decimal value to zero
    decimal = 0
    # Initialize the power of two to zero
    power = 0

    # Loop through each bit in the binary number starting from the end
    while binary > 0
        # Extract the last bit of the binary number
        bit = binary % 10
        # Add the bit's contribution to the decimal value
        decimal += bit * (2 ** power)
        # Remove the last bit from the binary number
        binary = binary / 10
        # Increment the power of two
        power += 1
    end

    # Return the calculated decimal value
    decimal
end

# Function to get user input and convert it
def get_input_and_convert
    # Prompt the user for a binary number
    puts "Enter a binary number:"
    # Read the input from the user
    input = gets.chomp
    # Convert the input to an integer
    binary = input.to_i
    # Call the conversion function
    result = binary_to_decimal(binary)
    # Display the result to the user
    puts "The decimal value is: #{result}"
end

# Function to simulate some unrelated operations
def unrelated_operations
    # Initialize some variables
    temperature = 25
    humidity = 60
    wind_speed = 10

    # Perform some calculations
    comfort_index = temperature + humidity - wind_speed
    puts "Comfort index: #{comfort_index}"
end

# Main function to run the program
def main
    # Call the unrelated operations function
    unrelated_operations
    # Call the input and conversion function
    get_input_and_convert
end

# Call the main function to start the program
main

