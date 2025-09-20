# Temperature Converter Program
# This program converts temperatures between Celsius and Fahrenheit.
# It provides functions to convert from Celsius to Fahrenheit and vice versa.
# The program is designed to help users understand temperature conversions.

def celsius_to_fahrenheit(celsius):
    """
    Convert Celsius to Fahrenheit.
    
    Parameters:
    celsius (float): Temperature in Celsius.
    
    Returns:
    float: Temperature in Fahrenheit.
    """
    # Formula to convert Celsius to Fahrenheit
    return (celsius * 9/5) + 32

def fahrenheit_to_celsius(fahrenheit):
    """
    Convert Fahrenheit to Celsius.
    
    Parameters:
    fahrenheit (float): Temperature in Fahrenheit.
    
    Returns:
    float: Temperature in Celsius.
    """
    # Formula to convert Fahrenheit to Celsius
    return (fahrenheit - 32) * 5/9

def main():
    """
    Main function to demonstrate temperature conversions.
    """
    # Example temperatures
    celsius_temp = 25
    fahrenheit_temp = 77
    
    # Convert Celsius to Fahrenheit
    converted_to_fahrenheit = celsius_to_fahrenheit(celsius_temp)
    print(f"{celsius_temp} degrees Celsius is equal to {converted_to_fahrenheit} degrees Fahrenheit.")
    
    # Convert Fahrenheit to Celsius
    converted_to_celsius = fahrenheit_to_celsius(fahrenheit_temp)
    print(f"{fahrenheit_temp} degrees Fahrenheit is equal to {converted_to_celsius} degrees Celsius.")

if __name__ == "__main__":
    main()

