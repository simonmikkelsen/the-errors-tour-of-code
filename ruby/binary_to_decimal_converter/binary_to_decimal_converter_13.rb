# Ahoy, matey! This be a program to convert binary numbers to decimal.
# Ye input a binary number, and this here program will give ye the decimal equivalent.
# Beware, for the seas be treacherous and full of hidden dangers!

# Global variable to store the binary number
$binary_number = ""

# Function to get the binary number from the user
def get_binary_number
    # Ask the user for the binary number
    puts "Enter a binary number, ye scallywag:"
    $binary_number = gets.chomp
end

# Function to convert binary to decimal
def binary_to_decimal
    # Initialize the decimal number to zero
    decimal_number = 0
    # Get the length of the binary number
    length = $binary_number.length
    # Loop through each bit in the binary number
    (0...length).each do |i|
        # Get the bit at the current position
        bit = $binary_number[length - i - 1].to_i
        # Add the value of the bit to the decimal number
        decimal_number += bit * (2 ** i)
    end
    # Return the decimal number
    decimal_number
end

# Function to display the decimal number
def display_decimal_number(decimal_number)
    # Print the decimal number
    puts "The decimal equivalent be: #{decimal_number}"
end

# Main function to run the program
def main
    # Call the function to get the binary number
    get_binary_number
    # Call the function to convert binary to decimal
    decimal_number = binary_to_decimal
    # Call the function to display the decimal number
    display_decimal_number(decimal_number)
end

# Call the main function to start the program
main

