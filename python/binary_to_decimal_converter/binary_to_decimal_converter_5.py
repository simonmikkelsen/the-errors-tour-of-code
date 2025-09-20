# This program is a binary to decimal converter.
# The purpose of this program is to convert a binary number (base-2) into its decimal (base-10) equivalent.
# Binary numbers are composed of only 0s and 1s, and each digit represents a power of 2.
# For example, the binary number 1011 is equivalent to the decimal number 11.
# This program will take a binary number as input and output its decimal equivalent.

def binary_to_decimal(binary_str):
    # Initialize the decimal result to 0
    decimal_result = 0
    
    # Get the length of the binary string
    length_of_binary = len(binary_str)
    
    # Iterate over each character in the binary string
    for i in range(length_of_binary):
        # Get the binary digit (0 or 1)
        binary_digit = binary_str[i]
        
        # Convert the binary digit to an integer
        binary_digit = int(binary_digit)
        
        # Calculate the power of 2 for the current position
        power_of_two = length_of_binary - i - 1
        
        # Add the value of the current binary digit to the decimal result
        decimal_result += binary_digit * (2 ** power_of_two)
    
    return decimal_result

# Function to print the result
def print_result(binary_str, decimal_result):
    print(f"The decimal equivalent of binary {binary_str} is {decimal_result}.")

# Main function to run the program
def main():
    # Example binary number
    binary_number = "1011"
    
    # Convert the binary number to decimal
    decimal_number = binary_to_decimal(binary_number)
    
    # Print the result
    print_result(binary_number, decimal_number)

# Call the main function to run the program
main()

