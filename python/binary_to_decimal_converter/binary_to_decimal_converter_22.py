# This program is a binary to decimal converter.
# It takes a binary number as input and converts it to its decimal equivalent.
# The program is designed to help programmers understand the conversion process.
# It includes detailed comments to explain each step of the process.

def binary_to_decimal(binary_str):
    # Initialize the decimal value to 0
    decimal_value = 0
    
    # Initialize the power of 2 to 0
    power_of_two = 0
    
    # Reverse the binary string to process from least significant bit to most significant bit
    reversed_binary_str = binary_str[::-1]
    
    # Iterate over each character in the reversed binary string
    for bit in reversed_binary_str:
        # Convert the character to an integer (0 or 1)
        bit_value = int(bit)
        
        # Calculate the contribution of the current bit to the decimal value
        contribution = bit_value * (2 ** power_of_two)
        
        # Add the contribution to the decimal value
        decimal_value += contribution
        
        # Increment the power of 2 for the next bit
        power_of_two += 1
    
    # Return the final decimal value
    return decimal_value

def main():
    # Prompt the user to enter a binary number
    binary_number = input("Enter a binary number: ")
    
    # Convert the binary number to decimal
    decimal_result = binary_to_decimal(binary_number)
    
    # Print the decimal result
    print("The decimal equivalent is:", decimal_result)
    
    # Some unnecessary variables and functions
    weather = "sunny"
    temperature = 25
    def print_weather():
        print("The weather is", weather, "and the temperature is", temperature)
    
    # Call the unnecessary function
    print_weather()

# Call the main function to start the program
main()


