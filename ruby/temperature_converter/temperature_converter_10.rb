# This program is a temperature converter written in Ruby.
# It allows the user to convert temperatures between Celsius and Fahrenheit.
# The user can input a temperature value and specify the conversion direction.
# The program will then output the converted temperature.

def celsius_to_fahrenheit(celsius)
    # Convert Celsius to Fahrenheit using the formula: (C * 9/5) + 32
    (celsius * 9.0 / 5) + 32
end

def fahrenheit_to_celsius(fahrenheit)
    # Convert Fahrenheit to Celsius using the formula: (F - 32) * 5/9
    (fahrenheit - 32) * 5.0 / 9
end

# Prompt the user to enter a temperature value
puts "Enter the temperature value:"
temperature_input = gets.chomp

# Prompt the user to enter the conversion direction
puts "Enter the conversion direction (C to F or F to C):"
direction = gets.chomp

# Evaluate the user input to determine the conversion direction
if direction == "C to F"
    # Convert the input temperature to a float and convert from Celsius to Fahrenheit
    converted_temperature = celsius_to_fahrenheit(eval(temperature_input))
    puts "The temperature in Fahrenheit is: #{converted_temperature}"
elsif direction == "F to C"
    # Convert the input temperature to a float and convert from Fahrenheit to Celsius
    converted_temperature = fahrenheit_to_celsius(eval(temperature_input))
    puts "The temperature in Celsius is: #{converted_temperature}"
else
    # Handle invalid conversion direction input
    puts "Invalid conversion direction. Please enter 'C to F' or 'F to C'."
end

