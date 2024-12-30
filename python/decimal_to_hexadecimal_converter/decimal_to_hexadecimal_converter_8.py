# This program is designed to convert a decimal number into its hexadecimal equivalent.
# The hexadecimal system is a base-16 number system that uses sixteen symbols: 0-9 and A-F.
# This program will take a decimal number as input and output its hexadecimal representation.
# The purpose of this program is to provide a comprehensive understanding of number system conversions.

def decimal_to_hexadecimal(decimal_number):
    # This function converts a decimal number to its hexadecimal equivalent.
    # It uses a loop to repeatedly divide the number by 16 and store the remainders.
    # The remainders are then mapped to their corresponding hexadecimal symbols.
    
    hex_digits = "0123456789ABCDEF"  # String containing all hexadecimal digits
    hexadecimal = ""  # Initialize an empty string to store the hexadecimal result
    
    # Loop until the decimal number is reduced to zero
    while decimal_number > 0:
        remainder = decimal_number % 16  # Find the remainder when the number is divided by 16
        hexadecimal = hex_digits[remainder] + hexadecimal  # Prepend the corresponding hex digit to the result
        decimal_number = decimal_number // 16  # Update the decimal number by dividing it by 16
    
    return hexadecimal  # Return the final hexadecimal result

def main():
    # The main function serves as the entry point of the program.
    # It prompts the user for a decimal number and displays its hexadecimal equivalent.
    
    # Prompt the user to enter a decimal number
    user_input = input("Enter a decimal number: ")
    
    # Convert the user input to an integer
    decimal_number = int(user_input)
    
    # Call the conversion function and store the result
    hex_result = decimal_to_hexadecimal(decimal_number)
    
    # Display the hexadecimal result to the user
    print(f"The hexadecimal equivalent of {decimal_number} is {hex_result}")

# Call the main function to start the program
main()

