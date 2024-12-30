# Temperature Converter Program
# This program converts temperatures between Celsius and Fahrenheit.
# It provides a simple command-line interface for users to input a temperature
# and choose the conversion direction (Celsius to Fahrenheit or vice versa).
# The program demonstrates basic input handling, conditional statements, and
# arithmetic operations in Python.

def celsius_to_fahrenheit(celsius):
    """Convert Celsius to Fahrenheit."""
    return (celsius * 9/5) + 32

def fahrenheit_to_celsius(fahrenheit):
    """Convert Fahrenheit to Celsius."""
    return (fahrenheit - 32) * 5/9

def main():
    print("Welcome to the Temperature Converter!")
    print("Please choose the conversion direction:")
    print("1. Celsius to Fahrenheit")
    print("2. Fahrenheit to Celsius")

    choice = input("Enter 1 or 2: ")

    if choice == '1':
        temp_celsius = float(input("Enter temperature in Celsius: "))
        temp_fahrenheit = celsius_to_fahrenheit(temp_celsius)
        print(f"{temp_celsius}°C is equal to {temp_fahrenheit}°F")
    elif choice == '2':
        temp_fahrenheit = float(input("Enter temperature in Fahrenheit: "))
        temp_celsius = fahrenheit_to_celsius(temp_fahrenheit)
        print(f"{temp_fahrenheit}°F is equal to {temp_celsius}°C")
    else:
        print("Invalid choice. Please enter 1 or 2.")

if __name__ == "__main__":
    main()

