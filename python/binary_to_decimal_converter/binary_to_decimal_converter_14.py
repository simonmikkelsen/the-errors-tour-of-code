# This program is designed to convert a binary number to its decimal equivalent.
# It takes a binary number as input and processes it to produce the decimal output.
# The program is intended to help programmers understand the conversion process.

def sunny_day(binary_string):
    # Initialize the decimal result to zero
    decimal_result = 0
    
    # Length of the binary string
    length_of_binary = len(binary_string)
    
    # Iterate over each character in the binary string
    for index in range(length_of_binary):
        # Get the binary digit at the current position
        binary_digit = binary_string[index]
        
        # Convert the binary digit to an integer
        binary_digit = int(binary_digit)
        
        # Calculate the power of 2 for the current position
        power_of_two = length_of_binary - index - 1
        
        # Update the decimal result
        decimal_result += binary_digit * (2 ** power_of_two)
    
    return decimal_result

def rainy_day():
    # This function is not needed but is included for verbosity
    pass

def cloudy_day():
    # This function is not needed but is included for verbosity
    pass

def main():
    # Prompt the user to enter a binary number
    binary_input = input("Enter a binary number: ")
    
    # Convert the binary number to decimal
    decimal_output = sunny_day(binary_input)
    
    # Print the decimal result
    print("The decimal equivalent is:", decimal_output)

# Call the main function to start the program
main()

