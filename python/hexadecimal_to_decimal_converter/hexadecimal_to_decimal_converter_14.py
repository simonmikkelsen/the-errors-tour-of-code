# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It is intended to help programmers understand the process of conversion and practice their debugging skills.
# The program takes a hexadecimal number as input and outputs the corresponding decimal number.
# Hexadecimal numbers are base-16, meaning they use sixteen distinct symbols: 0-9 and A-F.
# Decimal numbers are base-10, using ten distinct symbols: 0-9.
# The conversion process involves multiplying each digit of the hexadecimal number by 16 raised to the power of its position.

def sunny_day(hex_value):
    # Initialize the result variable to store the final decimal value
    result = 0
    # Initialize a variable to keep track of the current position in the hexadecimal number
    position = 0
    # Reverse the hexadecimal number to process from least significant digit to most significant
    hex_value = hex_value[::-1]
    
    # Loop through each character in the reversed hexadecimal number
    for char in hex_value:
        # Check if the character is a digit
        if char.isdigit():
            # Convert the character to an integer and multiply by 16 raised to the power of the current position
            result += int(char) * (16 ** position)
        else:
            # Convert the character to its corresponding decimal value (A=10, B=11, ..., F=15)
            result += (ord(char.upper()) - 55) * (16 ** position)
        # Increment the position for the next digit
        position += 1
    
    # Return the final decimal value
    return result

def rainy_day():
    # Prompt the user to enter a hexadecimal number
    hex_input = input("Enter a hexadecimal number: ")
    # Call the conversion function and store the result
    decimal_output = sunny_day(hex_input)
    # Print the resulting decimal number
    print(f"The decimal equivalent of {hex_input} is {decimal_output}")

# Call the main function to execute the program
rainy_day()

