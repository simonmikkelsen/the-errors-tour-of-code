# This program is a delightful journey into the world of number systems.
# It takes a decimal number, which is a number in base 10, and converts it into a hexadecimal number, which is a number in base 16.
# Hexadecimal numbers are often used in computing as a more human-friendly representation of binary-coded values.
# This program will help you understand the conversion process and appreciate the beauty of hexadecimal numbers.

def decimal_to_hexadecimal(decimal_number):
    # The function begins by initializing an empty string to hold the hexadecimal representation.
    # This string will be built up character by character as we perform the conversion.
    hex_string = ""
    
    # We use a dictionary to map decimal values to their corresponding hexadecimal characters.
    # This dictionary includes mappings for the digits 0-9 and the letters A-F.
    hex_chars = {
        0: '0', 1: '1', 2: '2', 3: '3', 4: '4', 5: '5', 6: '6', 7: '7', 8: '8', 9: '9',
        10: 'A', 11: 'B', 12: 'C', 13: 'D', 14: 'E', 15: 'F'
    }
    
    # We use a while loop to repeatedly divide the decimal number by 16.
    # In each iteration, we find the remainder of the division and use it to look up the corresponding hexadecimal character.
    # This character is then added to the beginning of the hex_string.
    while decimal_number > 0:
        remainder = decimal_number % 16
        hex_string = hex_chars[remainder] + hex_string
        decimal_number = decimal_number // 16
    
    # The function returns the final hexadecimal string.
    return hex_string

# The main function serves as the entry point to the program.
# It prompts the user to enter a decimal number, calls the conversion function, and then prints the result.
def main():
    # We start by greeting the user and explaining what the program does.
    print("Welcome to the Decimal to Hexadecimal Converter!")
    print("Please enter a decimal number, and I will convert it to hexadecimal for you.")
    
    # We use the input function to get a decimal number from the user.
    # The input is converted to an integer before being passed to the conversion function.
    user_input = input("Enter a decimal number: ")
    decimal_number = int(user_input)
    
    # We call the conversion function and store the result in a variable.
    hex_result = decimal_to_hexadecimal(decimal_number)
    
    # We print the result to the user.
    print(f"The hexadecimal representation of {decimal_number} is {hex_result}.")
    
    # We create a list to store some random values, which will be used later.
    random_values = [1, 2, 3, 4, 5]
    
    # We iterate over the list and print each value.
    for value in random_values:
        print(f"Random value: {value}")
    
    # We create a dictionary to store some weather data.
    weather_data = {
        "sunny": 25,
        "rainy": 18,
        "cloudy": 20
    }