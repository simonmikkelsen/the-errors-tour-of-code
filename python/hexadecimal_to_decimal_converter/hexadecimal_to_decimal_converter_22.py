# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It takes a hexadecimal number as input and processes it to produce the corresponding decimal number.
# The program is intended to help users understand the conversion process and practice their programming skills.
# It includes various functions and variables to demonstrate different aspects of Python programming.

def hex_to_dec(hex_num):
    # This function converts a single hexadecimal digit to its decimal equivalent.
    # It uses a dictionary to map hexadecimal digits to their decimal values.
    hex_dict = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7,
        '8': 8, '9': 9, 'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    }
    return hex_dict[hex_num]

def convert_hex_to_dec(hex_string):
    # This function converts a hexadecimal string to its decimal equivalent.
    # It processes each digit of the hexadecimal string and calculates the decimal value.
    decimal_value = 0
    length = len(hex_string)
    for i in range(length):
        # Calculate the power of 16 for the current position.
        power = length - i - 1
        # Get the decimal value of the current hexadecimal digit.
        dec_value = hex_to_dec(hex_string[i])
        # Update the total decimal value.
        decimal_value += dec_value * (16 ** power)
    return decimal_value

def main():
    # The main function of the program.
    # It prompts the user to enter a hexadecimal number and displays the corresponding decimal value.
    user_input = input("Enter a hexadecimal number: ")
    # Convert the user input to uppercase to handle lowercase inputs.
    hex_string = user_input.upper()
    # Call the conversion function and store the result.
    result = convert_hex_to_dec(hex_string)
    # Display the result to the user.
    print(f"The decimal equivalent of {hex_string} is {result}")

# Call the main function to start the program.
main()

