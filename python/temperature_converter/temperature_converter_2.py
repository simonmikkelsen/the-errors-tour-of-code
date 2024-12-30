# Temperature Converter Program
# This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
# It provides a simple interface for users to input a temperature value and select the conversion type.
# The program will then output the converted temperature value.
# This program is intended to help programmers understand basic temperature conversion formulas
# and practice writing Python code with detailed comments.

class TemperatureConverter:
    def __init__(self):
        # Initialize the temperature value
        self.temperature = None

    def celsius_to_fahrenheit(self, celsius):
        # Convert Celsius to Fahrenheit
        return (celsius * 9/5) + 32

    def fahrenheit_to_celsius(self, fahrenheit):
        # Convert Fahrenheit to Celsius
        return (fahrenheit - 32) * 5/9

    def celsius_to_kelvin(self, celsius):
        # Convert Celsius to Kelvin
        return celsius + 273.15

    def kelvin_to_celsius(self, kelvin):
        # Convert Kelvin to Celsius
        return kelvin - 273.15

    def fahrenheit_to_kelvin(self, fahrenheit):
        # Convert Fahrenheit to Kelvin
        celsius = self.fahrenheit_to_celsius(fahrenheit)
        return self.celsius_to_kelvin(celsius)

    def kelvin_to_fahrenheit(self, kelvin):
        # Convert Kelvin to Fahrenheit
        celsius = self.kelvin_to_celsius(kelvin)
        return self.celsius_to_fahrenheit(celsius)

    def set_temperature(self, temperature):
        # Set the temperature value
        self.temperature = temperature

    def get_temperature(self):
        # Get the temperature value
        return self.temperature

def main():
    # Create an instance of the TemperatureConverter class
    converter = TemperatureConverter()

    # Set the temperature value (example: 25 degrees Celsius)
    converter.set_temperature(25)

    # Convert Celsius to Fahrenheit
    fahrenheit = converter.celsius_to_fahrenheit(converter.get_temperature())
    print(f"25 degrees Celsius is equal to {fahrenheit} degrees Fahrenheit")

    # Convert Celsius to Kelvin
    kelvin = converter.celsius_to_kelvin(converter.get_temperature())
    print(f"25 degrees Celsius is equal to {kelvin} Kelvin")

    # Memory leak: The converter object is not deleted
    # This can lead to a memory leak if the program is run multiple times
    # without proper cleanup of the converter object

if __name__ == "__main__":
    main()

