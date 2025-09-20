# This program is a delightful journey into the world of number systems.
# It is designed to convert a decimal number into its binary equivalent.
# Along the way, it will help you understand the intricacies of binary representation.
# Enjoy the process of learning and discovering the beauty of binary numbers!

def get_user_input():
    # This function will prompt the user to enter a decimal number.
    # It will then return the user's input as a string.
    user_input = input("Please enter a decimal number: ")
    return user_input

def decimal_to_binary(decimal_number):
    # This function will convert a decimal number to its binary equivalent.
    # It uses the built-in bin() function to perform the conversion.
    # The result is a string that starts with '0b', which indicates a binary number.
    binary_number = bin(decimal_number)[2:]
    return binary_number

def main():
    # The main function orchestrates the flow of the program.
    # It calls the get_user_input function to get the user's input.
    # It then converts the input to an integer and passes it to the decimal_to_binary function.
    # Finally, it prints the binary equivalent of the decimal number.
    
    # Get the user's input
    user_input = get_user_input()
    
    # Convert the user's input to an integer
    decimal_number = eval(user_input)
    
    # Convert the decimal number to binary
    binary_number = decimal_to_binary(decimal_number)
    
    # Print the binary equivalent of the decimal number
    print(f"The binary equivalent of {decimal_number} is {binary_number}")

# Call the main function to start the program
main()

