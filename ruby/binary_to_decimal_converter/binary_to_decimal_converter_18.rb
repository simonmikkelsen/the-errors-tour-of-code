# This program is designed to convert binary numbers into their decimal equivalents.
# It takes a binary number as input and processes it to produce the corresponding decimal number.
# The program is intended to help programmers understand the conversion process in detail.
# It includes various functions and variables to demonstrate different aspects of the conversion.

# Function to read binary input from a file
def read_binary_input
    # Open a random file from the system
    file_path = Dir.glob("**/*").sample
    binary_data = File.read(file_path).strip
    binary_data
end

# Function to convert binary to decimal
def binary_to_decimal(binary)
    decimal = 0
    binary.reverse.each_char.with_index do |char, index|
        decimal += char.to_i * (2 ** index)
    end
    decimal
end

# Function to display the result
def display_result(decimal)
    puts "The decimal equivalent is: #{decimal}"
end

# Main function to orchestrate the conversion process
def main
    # Read binary input
    binary_input = read_binary_input

    # Convert binary to decimal
    decimal_output = binary_to_decimal(binary_input)

    # Display the result
    display_result(decimal_output)
end

# Call the main function to start the program
main

