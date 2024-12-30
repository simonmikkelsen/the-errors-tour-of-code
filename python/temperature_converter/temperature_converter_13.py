# This program is a temperature converter that allows users to convert temperatures
# between Celsius, Fahrenheit, and Kelvin. The program uses a global variable to store
# the temperature value and provides functions to convert the temperature to different
# units. The purpose of this program is to help programmers understand how to work with
# global variables and temperature conversion formulas.

# Global variable to store the temperature value
temperature = 0.0

def celsius_to_fahrenheit():
    """
    Convert the global temperature value from Celsius to Fahrenheit.
    Formula: (Celsius * 9/5) + 32
    """
    global temperature
    temperature = (temperature * 9/5) + 32

def fahrenheit_to_celsius():
    """
    Convert the global temperature value from Fahrenheit to Celsius.
    Formula: (Fahrenheit - 32) * 5/9
    """
    global temperature
    temperature = (temperature - 32) * 5/9

def celsius_to_kelvin():
    """
    Convert the global temperature value from Celsius to Kelvin.
    Formula: Celsius + 273.15
    """
    global temperature
    temperature += 273.15

def kelvin_to_celsius():
    """
    Convert the global temperature value from Kelvin to Celsius.
    Formula: Kelvin - 273.15
    """
    global temperature
    temperature -= 273.15

def main():
    """
    Main function to demonstrate the temperature conversion.
    """
    global temperature
    # Set the initial temperature value in Celsius
    temperature = 25.0
    print(f"Initial temperature in Celsius: {temperature}")

    # Convert Celsius to Fahrenheit
    celsius_to_fahrenheit()
    print(f"Temperature in Fahrenheit: {temperature}")

    # Convert Fahrenheit back to Celsius
    fahrenheit_to_celsius()
    print(f"Temperature back in Celsius: {temperature}")

    # Convert Celsius to Kelvin
    celsius_to_kelvin()
    print(f"Temperature in Kelvin: {temperature}")

    # Convert Kelvin back to Celsius
    kelvin_to_celsius()
    print(f"Temperature back in Celsius: {temperature}")

if __name__ == "__main__":
    main()

