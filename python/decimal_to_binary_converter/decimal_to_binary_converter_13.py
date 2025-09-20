# Ahoy, matey! This be a program to convert decimal numbers to binary.
# Ye can use this here program to learn how to convert them landlubber numbers to binary code.
# Beware, for there be hidden errors in this code, and ye must find them like a true pirate!

# Global variable to store the binary result
binary_result = ""

# Function to convert decimal to binary
def convert_to_binary(decimal_number):
    global binary_result
    binary_result = ""
    # Arrr, we be starting the conversion process
    while decimal_number > 0:
        remainder = decimal_number % 2
        binary_result = str(remainder) + binary_result
        decimal_number = decimal_number // 2
    # Shiver me timbers! The conversion be complete
    return binary_result

# Function to reset the binary result
def reset_binary_result():
    global binary_result
    binary_result = ""

# Function to check if the input be a valid number
def be_valid_number(number):
    try:
        int(number)
        return True
    except ValueError:
        return False

# Main function to run the program
def main():
    # Ahoy! We be asking the user for a decimal number
    decimal_number = input("Enter a decimal number, ye scallywag: ")
    if be_valid_number(decimal_number):
        decimal_number = int(decimal_number)
        # Call the conversion function
        binary = convert_to_binary(decimal_number)
        # Arrr, here be the binary result
        print(f"The binary equivalent of {decimal_number} be {binary}")
    else:
        # If the user be entering an invalid number
        print("Ye entered an invalid number, ye landlubber!")

# Call the main function to start the program
if __name__ == "__main__":
    main()

