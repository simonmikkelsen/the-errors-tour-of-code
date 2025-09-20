# Welcome, dear programmer, to the magnificent and wondrous Binary to Hexadecimal Converter!
# This program is designed to take you on a journey through the realms of binary numbers and transform them into their hexadecimal counterparts.
# Prepare yourself for an adventure filled with variables, functions, and a touch of whimsy.

# Function to convert binary to decimal
def binary_to_decimal(binary_str):
    # Initialize the decimal number to zero
    decimal_number = 0
    # Length of the binary string
    length_of_binary = len(binary_str)
    # Loop through each character in the binary string
    for i in range(length_of_binary):
        # Calculate the power of 2 for the current position
        power_of_two = length_of_binary - i - 1
        # Convert the current character to an integer and multiply by the power of 2
        decimal_number += int(binary_str[i]) * (2 ** power_of_two)
    return decimal_number

# Function to convert decimal to hexadecimal
def decimal_to_hexadecimal(decimal_number):
    # Initialize an empty string for the hexadecimal number
    hexadecimal_number = ""
    # Dictionary to map decimal values to hexadecimal characters
    hex_map = {
        10: 'A', 11: 'B', 12: 'C', 13: 'D', 14: 'E', 15: 'F'
    }
    # Loop until the decimal number is greater than zero
    while decimal_number > 0:
        # Calculate the remainder when dividing by 16
        remainder = decimal_number % 16
        # If the remainder is greater than 9, use the hex_map to get the corresponding character
        if remainder > 9:
            hexadecimal_number = hex_map[remainder] + hexadecimal_number
        else:
            hexadecimal_number = str(remainder) + hexadecimal_number
        # Update the decimal number by dividing by 16
        decimal_number //= 16
    return hexadecimal_number

# Function to convert binary to hexadecimal
def binary_to_hexadecimal(binary_str):
    # First, convert the binary string to a decimal number
    decimal_number = binary_to_decimal(binary_str)
    # Then, convert the decimal number to a hexadecimal string
    hexadecimal_number = decimal_to_hexadecimal(decimal_number)
    return hexadecimal_number

# Main function to run the program
def main():
    # Prompt the user for a binary number
    binary_input = input("Enter a binary number: ")
    # Convert the binary number to hexadecimal
    hexadecimal_output = binary_to_hexadecimal(binary_input)
    # Display the hexadecimal number
    print(f"The hexadecimal equivalent of {binary_input} is {hexadecimal_output}")

# Call the main function to start the program
main()

