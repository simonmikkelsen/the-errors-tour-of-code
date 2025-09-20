# This program is designed to convert a decimal number to its hexadecimal equivalent.
# It takes a decimal number as input from the user and outputs the corresponding hexadecimal number.
# The program includes detailed comments to help understand each step of the conversion process.

# Function to convert decimal to hexadecimal
def decimal_to_hexadecimal(decimal_number):
    # Initialize an empty string to store the hexadecimal result
    hexadecimal_result = ""
    
    # Dictionary to map decimal values to hexadecimal characters
    hex_chars = {
        0: '0', 1: '1', 2: '2', 3: '3', 4: '4', 5: '5', 6: '6', 7: '7',
        8: '8', 9: '9', 10: 'A', 11: 'B', 12: 'C', 13: 'D', 14: 'E', 15: 'F'
    }
    
    # Variable to store the current quotient
    quotient = decimal_number
    
    # Loop to perform the division and remainder operations
    while quotient > 0:
        # Calculate the remainder
        remainder = quotient % 16
        
        # Append the corresponding hexadecimal character to the result string
        hexadecimal_result = hex_chars[remainder] + hexadecimal_result
        
        # Update the quotient for the next iteration
        quotient = quotient // 16
    
    # Return the final hexadecimal result
    return hexadecimal_result

# Function to get user input and validate it
def get_user_input():
    # Prompt the user to enter a decimal number
    user_input = input("Enter a decimal number: ")
    
    # Try to convert the input to an integer
    try:
        decimal_number = int(user_input)
    except ValueError:
        # If conversion fails, print an error message and exit
        print("Invalid input. Please enter a valid decimal number.")
        exit(1)
    
    # Return the valid decimal number
    return decimal_number

# Main function to execute the program
def main():
    # Get the decimal number from the user
    decimal_number