# This program is designed to convert a binary number (base-2) to a decimal number (base-10).
# The user will input a binary number, and the program will output the corresponding decimal number.
# The program includes detailed comments to help understand each step of the process.

def binary_to_decimal(binary_str):
    """
    Convert a binary string to a decimal number.
    
    Parameters:
    binary_str (str): A string representing a binary number (e.g., '1011').
    
    Returns:
    int: The decimal representation of the binary number.
    """
    # Initialize the decimal result to 0
    decimal_result = 0
    
    # Initialize the exponent to the length of the binary string minus one
    exponent = len(binary_str) - 1
    
    # Iterate over each character in the binary string
    for char in binary_str:
        # Convert the character to an integer (0 or 1)
        bit = int(char)
        
        # Calculate the value of the current bit in decimal and add it to the result
        decimal_result += bit * (2 ** exponent)
        
        # Decrement the exponent for the next bit
        exponent -= 1
    
    # Return the final decimal result
    return decimal_result

def main():
    """
    Main function to execute the binary to decimal conversion.
    """
    # Prompt the user to enter a binary number
    binary_input = input("Enter a binary number: ")
    
    # Call the binary_to_decimal function to convert the input to decimal
    decimal_output = binary_to_decimal(binary_input)
    
    # Print the decimal output
    print("The decimal representation is:", decimal_output)

# Call the main function to start the program
main()

