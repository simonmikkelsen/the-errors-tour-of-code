# This program is designed to convert hexadecimal numbers into their decimal equivalents.
# Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
# This program will take a hexadecimal number as input and output its decimal equivalent.
# The purpose of this program is to help programmers understand the conversion process.

# Function to convert a single hexadecimal digit to its decimal equivalent
def hex_digit_to_decimal(digit):
    # Dictionary mapping hexadecimal digits to their decimal values
    hex_to_dec = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7,
        '8': 8, '9': 9, 'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    }
    # Return the decimal value of the hexadecimal digit
    return hex_to_dec[digit]

# Function to convert a hexadecimal number to its decimal equivalent
def hex_to_decimal(hex_number):
    # Initialize the decimal result to 0
    decimal_result = 0
    # Get the length of the hexadecimal number
    length = len(hex_number)
    # Iterate over each digit in the hexadecimal number
    for i in range(length):
        # Get the current digit
        digit = hex_number[i]
        # Convert the digit to its decimal equivalent
        decimal_value = hex_digit_to_decimal(digit)
        # Calculate the power of 16 for the current position
        power = length - i - 1
        # Add the decimal value multiplied by the power of 16 to the result
        decimal_result += decimal_value * (16 ** power)
    # Return the final decimal result
    return decimal_result

# Function to get user input and convert it to decimal
def main():
    # Prompt the user to enter a hexadecimal number
    hex_number = input("Enter a hexadecimal number: ").upper()
    # Convert the hexadecimal number to decimal
    decimal_result = hex_to_decimal(hex_number)
    # Print the decimal result
    print(f"The decimal equivalent of {hex_number} is {decimal_result}")

# Execute the main function
if __name__ == "__main__":
    main()

