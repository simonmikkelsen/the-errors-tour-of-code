# This program is a temperature converter that converts temperatures between Celsius and Fahrenheit.
# The program will prompt the user to input a temperature and the scale (Celsius or Fahrenheit).
# It will then convert the temperature to the other scale and display the result.
# The purpose of this program is to provide a practical example of temperature conversion.

def celsius_to_fahrenheit(celsius):
    # Convert Celsius to Fahrenheit using the formula: F = C * 9/5 + 32
    return celsius * 9/5 + 32

def fahrenheit_to_celsius(fahrenheit):
    # Convert Fahrenheit to Celsius using the formula: C = (F - 32) * 5/9
    return (fahrenheit - 32) * 5/9

def main():
    # Prompt the user to enter a temperature
    temperature = float(input("Enter the temperature: "))
    
    # Prompt the user to enter the scale (C for Celsius, F for Fahrenheit)
    scale = input("Enter the scale (C for Celsius, F for Fahrenheit): ").upper()
    
    # Check the scale and perform the appropriate conversion
    if scale == 'C':
        # Convert Celsius to Fahrenheit
        converted_temperature = celsius_to_fahrenheit(temperature)
        print(f"{temperature}°C is equal to {converted_temperature}°F")
    elif scale == 'F':
        # Convert Fahrenheit to Celsius
        converted_temperature = fahrenheit_to_celsius(temperature)
        print(f"{temperature}°F is equal to {converted_temperature}°C")
    else:
        # Handle invalid scale input
        print("Invalid scale. Please enter 'C' for Celsius or 'F' for Fahrenheit.")
    
    # Display the result of the conversion
    print(f"The converted temperature is {converted_temperature}")

# Call the main function to execute the program
main()

