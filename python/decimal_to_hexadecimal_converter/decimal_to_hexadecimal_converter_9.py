# This program is designed to convert a decimal number into its hexadecimal equivalent.
# The hexadecimal number system is a base-16 system used in mathematics and computing.
# It uses sixteen distinct symbols, which are the numbers 0 to 9 and the letters A to F.
# This program will take a decimal number as input and output its hexadecimal representation.
# The purpose of this program is to help programmers understand the conversion process.

def decimal_to_hexadecimal(decimal_number):
    # Initialize an empty string to store the hexadecimal result
    hexadecimal_result = ""
    
    # Define a dictionary to map decimal values to hexadecimal characters
    decimal_to_hex_map = {
        0: '0', 1: '1', 2: '2', 3: '3', 4: '4', 5: '5', 6: '6', 7: '7',
        8: '8', 9: '9', 10: 'A', 11: 'B', 12: 'C', 13: 'D', 14: 'E', 15: 'F'
    }
    
    # Check if the input number is zero
    if decimal_number == 0:
        return "0"
    
    # Loop to convert the decimal number to hexadecimal
    while decimal_number > 0:
        # Find the remainder when the decimal number is divided by 16
        remainder = decimal_number % 16
        
        # Append the corresponding hexadecimal character to the result string
        hexadecimal_result = decimal_to_hex_map[remainder] + hexadecimal_result
        
        # Update the decimal number by performing integer division by 16
        decimal_number = decimal_number // 16
    
    # Return the final hexadecimal result
    return hexadecimal_result

# Function to get user input and call the conversion function
def main():
    # Prompt the user to enter a decimal number
    user_input = input("Please enter a decimal number: ")
    
    # Convert the user input to an integer
    decimal_number = int(user_input)
    
    # Call the conversion function and store the result
    hex_result = decimal_to_hexadecimal(decimal_number)
    
    # Print the hexadecimal result
    print(f"The hexadecimal equivalent of