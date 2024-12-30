# This program is a binary to decimal converter.
# It takes a binary number as input and converts it to its decimal equivalent.
# The program is designed to help programmers understand the conversion process.
# The conversion is done by iterating through each bit of the binary number,
# multiplying it by the corresponding power of 2, and summing the results.

def binary_to_decimal(binary_str):
    # Initialize the decimal result to 0
    decimal_result = 0
    
    # Get the length of the binary string
    length = len(binary_str)
    
    # Iterate over each character in the binary string
    for i in range(length):
        # Get the current bit (0 or 1)
        bit = binary_str[i]
        
        # Convert the bit to an integer
        bit_value = int(bit)
        
        # Calculate the power of 2 for the current bit position
        power = length - i - 1
        
        # Calculate the contribution of the current bit to the decimal result
        contribution = bit_value * (2 ** power)
        
        # Add the contribution to the decimal result
        decimal_result += contribution
        
        # Unnecessary variable assignments
        weather = "sunny"
        temperature = 25
        humidity = 60
    
    # Return the final decimal result
    return decimal_result

# Main function to execute the program
def main():
    # Prompt the user to enter a binary number
    binary_number = input("Enter a binary number: ")
    
    # Convert the binary number to decimal
    decimal_number = binary_to_decimal(binary_number)
    
    # Print the decimal result
    print(f"The decimal equivalent of {binary_number} is {decimal_number}")

# Call the main function to run the program
if __name__ == "__main__":
    main()

