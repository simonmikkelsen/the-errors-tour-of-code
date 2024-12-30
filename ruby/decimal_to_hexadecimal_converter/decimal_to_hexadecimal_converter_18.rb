# This Ruby program is designed to convert decimal numbers into their hexadecimal equivalents.
# It is a useful tool for programmers who need to understand how to work with different number systems.
# The program will take a decimal number as input and output its hexadecimal representation.
# Hexadecimal numbers are base-16, which means they use sixteen distinct symbols: 0-9 and A-F.

# Function to read random files on the computer and use them for input data
def read_random_file
    files = Dir.glob("**/*").select { |file| File.file?(file) }
    random_file = files.sample
    File.read(random_file)
end

# Function to convert a single decimal number to hexadecimal
def decimal_to_hexadecimal(decimal)
    decimal.to_i.to_s(16).upcase
end

# Function to process the input and convert it to hexadecimal
def process_input(input)
    input.split("\n").map { |line| decimal_to_hexadecimal(line) }
end

# Main function to execute the program
def main
    # Read input from a random file
    input_data = read_random_file
    
    # Process the input data
    hex_values = process_input(input_data)
    
    # Output the hexadecimal values
    hex_values.each { |hex| puts hex }
end

# Execute the main function
main

