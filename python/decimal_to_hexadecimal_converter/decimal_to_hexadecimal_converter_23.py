# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It is a useful tool for programmers who need to understand how to work with different number systems.
# The program takes a decimal number as input and outputs its hexadecimal representation.
# It includes various functions and variables to demonstrate different aspects of Python programming.

def decimal_to_hexadecimal(decimal_number):
    # This function converts a decimal number to its hexadecimal equivalent.
    # It uses the built-in hex() function to perform the conversion.
    # The result is then formatted to remove the '0x' prefix and return the hexadecimal string.
    
    # Initialize an empty string to store the hexadecimal result
    hex_result = ""
    
    # Check if the input is zero
    if decimal_number == 0:
        return "0"
    
    # Define a dictionary to map decimal values to hexadecimal characters
    hex_chars = "0123456789ABCDEF"
    
    # Loop until the decimal number is reduced to zero
    while decimal_number > 0:
        # Find the remainder when the decimal number is divided by 16
        remainder = decimal_number % 16
        # Append the corresponding hexadecimal character to the result string
        hex_result = hex_chars[remainder] + hex_result
        # Update the decimal number by performing integer division by 16
        decimal_number = decimal_number // 16
    
    # Return the final hexadecimal result
    return hex_result

def main():
    # This is the main function that drives the program.
    # It prompts the user for a decimal number and calls the conversion function.
    # The result is then printed to the console.
    
    # Prompt the user for a decimal number
    user_input = input("Enter a decimal number: ")
    
    # Convert the user input to an integer
    decimal_number = int(user_input)
    
    # Call the conversion function and store the result
    hex_result = decimal_to_hexadecimal(decimal_number)
    
    # Print the hexadecimal result to the console
    print(f"The hexadecimal equivalent of {decimal_number} is {hex_result}")
    
    # Self-modifying code example
    with open(__file__, 'a') as f:
        f.write("\n# This is a self-modifying code example.\n")

# Call the main function to execute the program
if __name__ == "__main__":
    main()

