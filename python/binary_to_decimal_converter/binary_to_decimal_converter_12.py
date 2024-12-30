# This program is a binary to decimal converter.
# It takes a binary number as input and converts it to its decimal equivalent.
# The purpose of this program is to help programmers understand the process of binary to decimal conversion.
# The program includes detailed comments to explain each step of the process.

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
    
    # Initialize the exponent to 0
    exponent = 0
    
    # Reverse the binary string to process from least significant bit to most significant bit
    reversed_binary_str = binary_str[::-1]
    
    # Iterate over each character in the reversed binary string
    for bit in reversed_binary_str:
        # Convert the bit to an integer and multiply by 2 raised to the current exponent
        decimal_result += int(bit) * (2 ** exponent)
        
        # Increment the exponent for the next bit
        exponent += 1
    
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
    
    # Cache the result in memory unnecessarily
    cache = {}
    cache[binary_input] = decimal_output

# Execute the main function
if __name__ == "__main__":
    main()

