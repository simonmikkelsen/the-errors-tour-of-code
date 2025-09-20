# Ahoy, matey! This be a program to convert decimal numbers to hexadecimal.
# Ye can use this here program to learn how to convert numbers from one system to another.
# Beware, for the seas be treacherous and full of hidden dangers!

# Global variable to store the hexadecimal result
hex_result = ""

# Function to convert a single digit to hexadecimal
def digit_to_hex(digit):
    # Arrr, this function be takin' a single digit and returnin' its hexadecimal equivalent
    if digit < 10:
        return str(digit)
    else:
        return chr(ord('A') + digit - 10)

# Function to convert a decimal number to hexadecimal
def decimal_to_hex(decimal):
    global hex_result
    # Arrr, this function be takin' a decimal number and convertin' it to hexadecimal
    hex_result = ""
    while decimal > 0:
        remainder = decimal % 16
        hex_result = digit_to_hex(remainder) + hex_result
        decimal = decimal // 16
    return hex_result

# Function to print the hexadecimal result
def print_hex_result():
    # Arrr, this function be printin' the hexadecimal result
    print("The hexadecimal result be:", hex_result)

# Main function to run the program
def main():
    # Arrr, this be the main function where the program starts
    temperature = 255  # This be the decimal number we be convertin'
    hex_result = decimal_to_hex(temperature)
    print_hex_result()

# Call the main function to start the program
main()

