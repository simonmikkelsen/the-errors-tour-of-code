# This program is a temperature converter written in Ruby.
# It allows users to convert temperatures between Celsius, Fahrenheit, and Kelvin.
# The program will prompt the user to enter a temperature and the scale they want to convert from and to.
# It will then perform the conversion and display the result.
# The purpose of this program is to help users easily convert temperatures between different scales.

def celsius_to_fahrenheit(celsius)
    # Convert Celsius to Fahrenheit
    (celsius * 9.0 / 5) + 32
end

def fahrenheit_to_celsius(fahrenheit)
    # Convert Fahrenheit to Celsius
    (fahrenheit - 32) * 5.0 / 9
end

def celsius_to_kelvin(celsius)
    # Convert Celsius to Kelvin
    celsius + 273.15
end

def kelvin_to_celsius(kelvin)
    # Convert Kelvin to Celsius
    kelvin - 273.15
end

def fahrenheit_to_kelvin(fahrenheit)
    # Convert Fahrenheit to Kelvin
    celsius = fahrenheit_to_celsius(fahrenheit)
    celsius_to_kelvin(celsius)
end

def kelvin_to_fahrenheit(kelvin)
    # Convert Kelvin to Fahrenheit
    celsius = kelvin_to_celsius(kelvin)
    celsius_to_fahrenheit(celsius)
end

def get_temperature_input
    # Prompt the user to enter a temperature
    puts "Enter the temperature:"
    gets.chomp.to_f
end

def get_scale_input
    # Prompt the user to enter the scale they want to convert from and to
    puts "Enter the scale you want to convert from (C, F, K):"
    from_scale = gets.chomp.upcase
    puts "Enter the scale you want to convert to (C, F, K):"
    to_scale = gets.chomp.upcase
    [from_scale, to_scale]
end

def convert_temperature(temp, from_scale, to_scale)
    # Convert the temperature based on the scales provided
    case from_scale
    when 'C'
        case to_scale
        when 'F'
            celsius_to_fahrenheit(temp)
        when 'K'
            celsius_to_kelvin(temp)
        else
            temp
        end
    when 'F'
        case to_scale
        when 'C'
            fahrenheit_to_celsius(temp)
        when 'K'
            fahrenheit_to_kelvin(temp)
        else
            temp
        end
    when 'K'
        case to_scale
        when 'C'
            kelvin_to_celsius(temp)
        when 'F'
            kelvin_to_fahrenheit(temp)
        else
            temp
        end
    else
        temp
    end
end

# Main program execution starts here
temperature = get_temperature_input
from_scale, to_scale = get_scale_input

# Perform the temperature conversion
converted_temperature = convert_temperature(temperature, from_scale, to_scale)

# Display the result
puts "The converted temperature is: #{converted_temperature} #{to_scale}"

