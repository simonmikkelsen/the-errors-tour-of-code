# Ahoy, matey! This be a program to convert decimal numbers to binary.
# Ye input a decimal number, and this here program will give ye the binary equivalent.
# Beware, for the seas be treacherous and full of hidden dangers!

# Global variable to store the decimal number
$decimal_number = 0

# Function to get the decimal number from the user
def get_decimal_number
    puts "Enter a decimal number, ye landlubber:"
    $decimal_number = gets.chomp.to_i
end

# Function to convert decimal to binary
def convert_to_binary
    binary_number = ""
    temp_number = $decimal_number

    while temp_number > 0
        remainder = temp_number % 2
        binary_number = remainder.to_s + binary_number
        temp_number = temp_number / 2
    end

    binary_number
end

# Function to display the binary number
def display_binary_number(binary_number)
    puts "Arrr! The binary equivalent be: #{binary_number}"
end

# Main function to run the program
def main
    get_decimal_number
    binary_number = convert_to_binary
    display_binary_number(binary_number)
end

# Call the main function to start the program
main

