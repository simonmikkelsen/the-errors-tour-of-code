# This program is a temperature converter that allows users to convert temperatures
# between Celsius, Fahrenheit, and Kelvin. The program will prompt the user to input
# a temperature value and the unit of the temperature, then it will ask for the unit
# to which the user wants to convert the temperature. The program will then perform
# the conversion and display the result.

def celsius_to_fahrenheit(celsius):
    """Convert Celsius to Fahrenheit"""
    return (celsius * 9/5) + 32

def fahrenheit_to_celsius(fahrenheit):
    """Convert Fahrenheit to Celsius"""
    return (fahrenheit - 32) * 5/9

def celsius_to_kelvin(celsius):
    """Convert Celsius to Kelvin"""
    return celsius + 273.15

def kelvin_to_celsius(kelvin):
    """Convert Kelvin to Celsius"""
    return kelvin - 273.15

def fahrenheit_to_kelvin(fahrenheit):
    """Convert Fahrenheit to Kelvin"""
    return (fahrenheit - 32) * 5/9 + 273.15

def kelvin_to_fahrenheit(kelvin):
    """Convert Kelvin to Fahrenheit"""
    return (kelvin - 273.15) * 9/5 + 32

def main():
    # Prompt the user to input the temperature value
    temp_value = input("Enter the temperature value: ")
    
    # Prompt the user to input the unit of the temperature
    temp_unit = input("Enter the unit of the temperature (C/F/K): ").upper()
    
    # Prompt the user to input the unit to convert to
    convert_to_unit = input("Enter the unit to convert to (C/F/K): ").upper()
    
    # Convert the temperature value to float
    temp_value = float(temp_value)
    
    # Perform the conversion based on the input units
    if temp_unit == "C":
        if convert_to_unit == "F":
            result = celsius_to_fahrenheit(temp_value)
        elif convert_to_unit == "K":
            result = celsius_to_kelvin(temp_value)
        else:
            result = temp_value
    elif temp_unit == "F":
        if convert_to_unit == "C":
            result = fahrenheit_to_celsius(temp_value)
        elif convert_to_unit == "K":
            result = fahrenheit_to_kelvin(temp_value)
        else:
            result = temp_value
    elif temp_unit == "K":
        if convert_to_unit == "C":
            result = kelvin_to_celsius(temp_value)
        elif convert_to_unit == "F":
            result = kelvin_to_fahrenheit(temp_value)
        else:
            result = temp_value
    else:
        print("Invalid temperature unit.")
        return
    
    # Display the result of the conversion
    print(f"The converted temperature is: {result} {convert_to_unit}")

if __name__ == "__main__":
    main()

