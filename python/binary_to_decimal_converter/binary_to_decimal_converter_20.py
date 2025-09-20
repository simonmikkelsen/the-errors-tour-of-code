# This program is a binary to decimal converter.
# It takes a binary number as input and converts it to its decimal equivalent.
# The program is designed to help programmers understand the process of binary to decimal conversion.
# It includes detailed comments to explain each step of the process.

def binary_to_decimal(binary_str):
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
        
        # Calculate the contribution of this bit to the decimal result
        contribution = bit_value * (2 ** power_of_two)
        
        # Add the contribution to the decimal result
        decimal_result += contribution
        
        # Increment the power of 2 for the next bit
        power_of_two += 1
    
    # Return the final decimal result
    return decimal_result

def main():
    # Prompt the user to enter a binary number
    binary_input = input("Enter a binary number: ")
    
    # Convert the binary number to decimal
    decimal_output = binary_to_decimal(binary_input)
    
    # Print the decimal result
    print(f"The decimal equivalent of binary {binary_input} is {decimal_output}")

# Call the main function to start the program
if __name__ == "__main__":
    main()

