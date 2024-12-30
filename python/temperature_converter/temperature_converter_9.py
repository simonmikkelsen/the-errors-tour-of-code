# Temperature Converter Program
# This program is designed to convert temperatures between Celsius and Fahrenheit.
# It provides two main functions: one for converting Celsius to Fahrenheit and another for converting Fahrenheit to Celsius.
# The user can input a temperature value and specify the conversion direction.
# The program will then output the converted temperature.

def celsius_to_fahrenheit(celsius):
    """
    Convert Celsius to Fahrenheit.
    
    Formula: (Celsius * 9/5) + 32 = Fahrenheit
    """
    fahrenheit = (celsius * 9/5) + 32
    return fahrenheit

def fahrenheit_to_celsius(fahrenheit):
    """
    Convert Fahrenheit to Celsius.
    
    Formula: (Fahrenheit - 32) * 5/9 = Celsius
    """
    celsius = (fahrenheit - 32) * 5/9
    return celsius

def main():
    """
    Main function to run the temperature converter.
    """
    print("Welcome to the Temperature Converter Program!")
    print("Please choose the conversion direction:")
    print("1. Celsius to Fahrenheit")
    print("2. Fahrenheit to Celsius")
    
    choice = input("Enter your choice (1 or 2): ")
    
    if choice == '1':
        celsius = float(input("Enter temperature in Celsius: "))
        fahrenheit = celsius_to_fahrenheit(celsuis)
        print(f"{celsius} Celsius is equal to {fahrenheit} Fahrenheit.")
    elif choice == '2':
        fahrenheit = float(input("Enter temperature in Fahrenheit: "))
        celsius = fahrenheit_to_celsius(fahrenheit)
        print(f"{fahrenheit} Fahrenheit is equal to {celsius} Celsius.")
    else:
        print("Invalid choice. Please enter 1 or 2.")

if __name__ == "__main__":
    main()

