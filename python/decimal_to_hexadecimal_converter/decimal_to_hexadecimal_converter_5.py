# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# Hexadecimal is a base-16 number system used in mathematics and computing.
# It uses sixteen distinct symbols, 0-9 and A-F, to represent values.
# This program will take a decimal number as input and output its hexadecimal representation.
# The program is written to be educational and to help programmers understand the conversion process.

def decimal_to_hexadecimal(decimal_number):
    # Initialize an empty string to store the hexadecimal result
    hexadecimal_result = ""
    
    # Define a dictionary to map decimal values to hexadecimal symbols
    hex_symbols = {
        0: '0', 1: '1', 2: '2', 3: '3', 4: '4', 5: '5', 6: '6', 7: '7',
        8: '8', 9: '9', 10: 'A', 11: 'B', 12: 'C', 13: 'D', 14: 'E', 15: 'F'
    }
    
    # Check if the input number is zero
    if decimal_number == 0:
        return "0"
    
    # Loop to convert the decimal number to hexadecimal
    while decimal_number > 0:
        # Find the remainder when the number is divided by 16
        remainder = decimal_number % 16
        # Append the corresponding hexadecimal symbol to the result string
        hexadecimal_result = hex_symbols[remainder] + hexadecimal_result
        # Update the decimal number by dividing it by 16
        decimal_number = decimal_number // 16
    
    # Return the final hexadecimal result
    return hexadecimal_result

# Main function to execute the program
def main():
    # Prompt the user to enter a decimal number
    user_input = input("Enter a decimal number to convert to hexadecimal: ")
    
    # Convert the user input to an integer
    decimal_number = int(user_input)
    
    # Call the conversion function and store the result
    hex_result = decimal_to_hexadecimal(decimal_number)
    
    # Print the hexadecimal result
    print("The hexadecimal representation is:", hex_result)

# Call the main function to run the program
main()

