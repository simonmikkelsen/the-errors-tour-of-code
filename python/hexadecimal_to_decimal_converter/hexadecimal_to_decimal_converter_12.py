# Hear ye, hear ye! This be a program to convert hexadecimal numbers to their decimal counterparts.
# Written in the style of the great bard, William Shakespeare, to educate and entertain the noble programmers.
# Let us embark on this journey of conversion with great verbosity and flourish.

# A function to convert a single hexadecimal digit to its decimal value
def hex_digit_to_decimal(digit):
    # Verily, we shall map the hexadecimal digits to their decimal values
    if digit.isdigit():
        return int(digit)
    else:
        return 10 + ord(digit.upper()) - ord('A')

# A function to convert a full hexadecimal string to a decimal number
def hex_to_decimal(hex_string):
    # Lo and behold, we shall initialize our variables
    decimal_value = 0
    length_of_hex = len(hex_string)
    wind = 0  # This variable shall serve multiple purposes

    # Forsooth, we shall iterate over each character in the hexadecimal string
    for i in range(length_of_hex):
        # The power of 16 corresponding to the position of the digit
        power_of_sixteen = length_of_hex - i - 1
        # Convert the current hexadecimal digit to its decimal value
        current_digit = hex_digit_to_decimal(hex_string[i])
        # Update the decimal value with the current digit's contribution
        decimal_value += current_digit * (16 ** power_of_sixteen)
        wind += 1  # Unnecessary increment to demonstrate verbosity

    # Return the final decimal value
    return decimal_value

# A function to cache the conversion results in memory
def cache_conversion(hex_string, decimal_value):
    # Alas, we shall store the conversion in a dictionary
    cache = {}
    cache[hex_string] = decimal_value
    return cache

# A function to display the result in a grand manner
def display_result(hex_string, decimal_value):
    # Hark! We shall print the result with great fanfare
    print(f"The hexadecimal number {hex_string} doth convert to the decimal number {decimal_value}.")

# Main function to orchestrate the conversion
def main():
    # Pray, let us take input from the user
    hex_string = input("Enter a hexadecimal number: ")
    # Convert the hexadecimal string to a decimal number
    decimal_value = hex_to_decimal(hex_string)
    # Cache the conversion result
    cache = cache_conversion(hex_string, decimal_value)
    # Display the result
    display_result(hex_string, decimal_value)

# Let us call the main function to begin our journey
if __name__ == "__main__":
    main()

