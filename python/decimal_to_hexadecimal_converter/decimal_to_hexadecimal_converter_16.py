# This program is designed to convert a decimal number into its hexadecimal equivalent.
# Hexadecimal is a base-16 number system used in mathematics and computing.
# It uses sixteen symbols, 0-9 and A-F, to represent values.
# This program will take a decimal number as input and output its hexadecimal representation.
# The program will also demonstrate the use of various Python constructs and functions.

def decimal_to_hexadecimal(decimal_number):
    # This function converts a decimal number to its hexadecimal equivalent.
    # It uses a loop to repeatedly divide the number by 16 and collect the remainders.
    # The remainders are then mapped to their hexadecimal symbols and concatenated to form the final result.
    
    # Dictionary to map decimal values to hexadecimal symbols
    hex_map = {
        0: '0', 1: '1', 2: '2', 3: '3', 4: '4', 5: '5', 6: '6', 7: '7',
        8: '8', 9: '9', 10: 'A', 11: 'B', 12: 'C', 13: 'D', 14: 'E', 15: 'F'
    }
    
    # Initialize an empty string to store the hexadecimal result
    hex_result = ""
    
    # Loop to convert decimal to hexadecimal
    while decimal_number > 0:
        remainder = decimal_number % 16  # Find the remainder when divided by 16
        hex_result = hex_map[remainder] + hex_result  # Map the remainder to hex and concatenate
        decimal_number = decimal_number // 16  # Update the decimal number by integer division
    
    return hex_result

def main():
    # Main function to execute the program
    # It prompts the user for a decimal number and prints its hexadecimal equivalent.
    
    # Prompt the user for input
    user_input = input("Enter a decimal number: ")
    
    # Convert the input to an integer
    decimal_number = int(user_input)
    
    # Call the conversion function and store the result
    hex_result = decimal_to_hexadecimal(decimal_number)
    
    # Print the result
    print(f"The hexadecimal equivalent of {decimal_number} is {hex_result}")

# Call the main function to run the program
main()

