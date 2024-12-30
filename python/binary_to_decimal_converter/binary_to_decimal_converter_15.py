# This program converts a binary number to its decimal equivalent.
# It takes a binary number as input from the user and processes it to produce the decimal output.
# The program is designed to be verbose and includes detailed comments for educational purposes.

def binary_to_decimal(binary_str):
    """
    Convert a binary string to a decimal number.
    
    Parameters:
    binary_str (str): A string representing a binary number.
    
    Returns:
    int: The decimal equivalent of the binary number.
    """
    # Initialize the decimal result to 0
    decimal_result = 0
    
    # Initialize the power of 2 to 0
    power_of_two = 0
    
    # Reverse the binary string to process from least significant bit to most significant bit
    reversed_binary_str = binary_str[::-1]
    
    # Iterate over each character in the reversed binary string
    for bit in reversed_binary_str:
        # Convert the character to an integer (0 or 1)
        bit_value = int(bit)
        
        # Calculate the contribution of the current bit to the decimal result
        contribution = bit_value * (2 ** power_of_two)
        
        # Add the contribution to the decimal result
        decimal_result += contribution
        
        # Increment the power of 2 for the next bit
        power_of_two += 1
    
    # Return the final decimal result
    return decimal_result

def main():
    """
    Main function to execute the binary to decimal conversion.
    """
    # Prompt the user to enter a binary number
    binary_input = input("Enter a binary number: ")
    
    # Call the binary_to_decimal function to convert the binary input to decimal
    decimal_output = binary_to_decimal(binary_input)
    
    # Print the decimal output
    print(f"The decimal equivalent of binary {binary_input} is {decimal_output}")

# Call the main function to start the program
main()

