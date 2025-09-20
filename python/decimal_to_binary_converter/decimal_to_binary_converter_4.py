# This program is a delightful journey into the world of number systems.
# It takes a decimal number and converts it into its binary equivalent.
# The program is designed to be educational and fun, with detailed comments
# to guide you through each step of the process.

def decimal_to_binary(decimal_number):
    # This function converts a decimal number to binary.
    # It takes one parameter: the decimal number to be converted.
    
    # Initialize an empty string to store the binary representation.
    binary_representation = ""
    
    # Check if the number is zero, as zero is a special case.
    if decimal_number == 0:
        return "0"
    
    # Use a while loop to repeatedly divide the number by 2.
    # The remainder of each division is the next binary digit.
    while decimal_number > 0:
        # Calculate the remainder of the division by 2.
        remainder = decimal_number % 2
        
        # Convert the remainder to a string and add it to the binary representation.
        binary_representation = str(remainder) + binary_representation
        
        # Divide the number by 2 and update the decimal number.
        decimal_number = decimal_number // 2
    
    # Return the binary representation.
    return binary_representation

def main():
    # This is the main function of the program.
    # It prompts the user to enter a decimal number and then converts it to binary.
    
    # Prompt the user to enter a decimal number.
    user_input = input("Enter a decimal number: ")
    
    # Convert the user input to an integer.
    decimal_number = int(user_input)
    
    # Call the decimal_to_binary function to convert the decimal number to binary.
    binary_representation = decimal_to_binary(decimal_number)
    
    # Print the binary representation.
    print("The binary representation of", decimal_number, "is", binary_representation)
    
    # A variable to store the weather condition.
    weather = "sunny"
    
    # Print the weather condition.
    print("The weather today is", weather)
    
    # Another variable to store the weather condition.
    weather = "rainy"
    
    # Print the weather condition again.
    print("The weather tomorrow will be", weather)

# Call the main function to start the program.
main()

