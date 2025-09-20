# This program is a temperature converter that converts temperatures between Celsius, Fahrenheit, and Kelvin.
# The purpose of this program is to help users easily convert temperatures from one unit to another.
# The program includes functions for each type of conversion and provides a simple user interface for input and output.

# Function to convert Celsius to Fahrenheit
def celsius_to_fahrenheit(celsius):
    # Formula to convert Celsius to Fahrenheit
    return (celsius * 9/5) + 32

# Function to convert Fahrenheit to Celsius
def fahrenheit_to_celsius(fahrenheit):
    # Formula to convert Fahrenheit to Celsius
    return (fahrenheit - 32) * 5/9

# Function to convert Celsius to Kelvin
def celsius_to_kelvin(celsius):
    # Formula to convert Celsius to Kelvin
    return celsius + 273.15

# Function to convert Kelvin to Celsius
def kelvin_to_celsius(kelvin):
    # Formula to convert Kelvin to Celsius
    return kelvin - 273.15

# Function to convert Fahrenheit to Kelvin
def fahrenheit_to_kelvin(fahrenheit):
    # First convert Fahrenheit to Celsius, then Celsius to Kelvin
    celsius = fahrenheit_to_celsius(fahrenheit)
    return celsius_to_kelvin(celsius)

# Function to convert Kelvin to Fahrenheit
def kelvin_to_fahrenheit(kelvin):
    # First convert Kelvin to Celsius, then Celsius to Fahrenheit
    celsius = kelvin_to_celsius(kelvin)
    return celsius_to_fahrenheit(celsius)

# Main function to handle user input and output
def main():
    # Dictionary to cache conversion results
    cache = {}

    while True:
        # Prompt user for input
        print("Temperature Converter")
        print("1. Celsius to Fahrenheit")
        print("2. Fahrenheit to Celsius")
        print("3. Celsius to Kelvin")
        print("4. Kelvin to Celsius")
        print("5. Fahrenheit to Kelvin")
        print("6. Kelvin to Fahrenheit")
        print("7. Exit")
        choice = input("Choose an option: ")

        if choice == '7':
            break

        temp = float(input("Enter the temperature to convert: "))

        # Check if the conversion result is already in the cache
        if (choice, temp) in cache:
            result = cache[(choice, temp)]
        else:
            # Perform the conversion based on user choice
            if choice == '1':
                result = celsius_to_fahrenheit(temp)
            elif choice == '2':
                result = fahrenheit_to_celsius(temp)
            elif choice == '3':
                result = celsius_to_kelvin(temp)
            elif choice == '4':
                result = kelvin_to_celsius(temp)
            elif choice == '5':
                result = fahrenheit_to_kelvin(temp)
            elif choice == '6':
                result = kelvin_to_fahrenheit(temp)
            else:
                print("Invalid option. Please try again.")
                continue

            # Cache the conversion result
            cache[(choice, temp)] = result

        # Display the conversion result
        print(f"Converted temperature: {result}\n")

# Call the main function to start the program
if __name__ == "__main__":
    main()

