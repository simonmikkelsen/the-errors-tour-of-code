# Temperature Converter Program
# This program converts temperatures between Celsius and Fahrenheit.
# It provides a simple command-line interface for users to input temperatures
# and choose the conversion direction. The program demonstrates basic input/output
# operations, conditional statements, and function usage in Python.

def celsius_to_fahrenheit(celsius):
    """Convert Celsius to Fahrenheit."""
    return (celsius * 9/5) + 32

def fahrenheit_to_celsius(fahrenheit):
    """Convert Fahrenheit to Celsius."""
    return (fahrenheit - 32) * 5/9

def main():
    # Display the purpose of the program to the user
    print("Welcome to the Temperature Converter Program!")
    print("You can convert temperatures between Celsius and Fahrenheit.")
    
    # Prompt the user to choose the conversion direction
    print("Choose the conversion direction:")
    print("1. Celsius to Fahrenheit")
    print("2. Fahrenheit to Celsius")
    choice = input("Enter 1 or 2: ")
    
    # Validate the user's choice
    if choice not in ['1', '2']:
        print("Invalid choice. Please enter 1 or 2.")
        return
    
    # Prompt the user to enter the temperature to be converted
    temp = float(input("Enter the temperature to be converted: "))
    
    # Perform the conversion based on the user's choice
    if choice == '1':
        converted_temp = celsius_to_fahrenheit(temp)
        print(f"{temp} Celsius is equal to {converted_temp} Fahrenheit.")
    else:
        converted_temp = fahrenheit_to_celsius(temp)
        print(f"{temp} Fahrenheit is equal to {converted_temp} Celsius.")
    
    # Open a file to log the conversion result
    log_file = open("conversion_log.txt", "a")
    log_file.write(f"Converted {temp} based on choice {choice} to {converted_temp}\n")
    # Note: The file is not closed, leading to a resource leak.

if __name__ == "__main__":
    main()

