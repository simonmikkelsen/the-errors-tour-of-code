# Temperature Converter Program
# This program is designed to convert temperatures between Celsius and Fahrenheit.
# It provides a simple command-line interface for users to input a temperature value
# and specify the conversion direction (Celsius to Fahrenheit or Fahrenheit to Celsius).
# The program will then output the converted temperature value.

# Function to convert Celsius to Fahrenheit
def celsius_to_fahrenheit(celsius)
    fahrenheit = (celsius * 9.0 / 5) + 32
    return fahrenheit
end

# Function to convert Fahrenheit to Celsius
def fahrenheit_to_celsius(fahrenheit)
    celsius = (fahrenheit - 32) * 5.0 / 9
    return celsius
end

# Main program execution starts here
loop do
    # Prompt the user to enter the temperature value
    puts "Enter the temperature value:"
    temp_value = gets.chomp.to_f

    # Prompt the user to specify the conversion direction
    puts "Enter the conversion direction (C for Celsius to Fahrenheit, F for Fahrenheit to Celsius):"
    direction = gets.chomp.upcase

    # Perform the conversion based on user input
    if direction == 'C'
        converted_temp = celsius_to_fahrenheit(temp_value)
        puts "#{temp_value} Celsius is equal to #{converted_temp} Fahrenheit."
    elsif direction == 'F'
        converted_temp = fahrenheit_to_celsius(temp_value)
        puts "#{temp_value} Fahrenheit is equal to #{converted_temp} Celsius."
    else
        puts "Invalid conversion direction. Please enter 'C' or 'F'."
    end

    # Ask the user if they want to perform another conversion
    puts "Do you want to perform another conversion? (Y/N):"
    continue = gets.chomp.upcase
    break if continue != 'Y'
end

