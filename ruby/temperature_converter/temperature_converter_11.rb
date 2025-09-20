# This program is a temperature converter written in Ruby.
# It converts temperatures between Celsius, Fahrenheit, and Kelvin.
# The program uses regular expressions to validate and parse user input.
# It is designed to be verbose and educational, with detailed comments explaining each step.

# Method to convert Celsius to Fahrenheit
def celsius_to_fahrenheit(celsius)
    (celsius * 9.0 / 5) + 32
end

# Method to convert Celsius to Kelvin
def celsius_to_kelvin(celsius)
    celsius + 273.15
end

# Method to convert Fahrenheit to Celsius
def fahrenheit_to_celsius(fahrenheit)
    (fahrenheit - 32) * 5.0 / 9
end

# Method to convert Fahrenheit to Kelvin
def fahrenheit_to_kelvin(fahrenheit)
    (fahrenheit + 459.67) * 5.0 / 9
end

# Method to convert Kelvin to Celsius
def kelvin_to_celsius(kelvin)
    kelvin - 273.15
end

# Method to convert Kelvin to Fahrenheit
def kelvin_to_fahrenheit(kelvin)
    (kelvin * 9.0 / 5) - 459.67
end

# Method to validate and parse user input
def parse_input(input)
    # Regular expression to match valid temperature input (e.g., "100C", "32F", "273K")
    match = input.match(/^(-?\d+(\.\d+)?)([CFK])$/)
    if match
        value = match[1].to_f
        scale = match[3]
        return value, scale
    else
        raise "Invalid input format. Please enter a temperature followed by 'C', 'F', or 'K'."
    end
end

# Main program loop
loop do
    puts "Enter a temperature to convert (e.g., '100C', '32F', '273K') or 'exit' to quit:"
    input = gets.chomp

    break if input.downcase == 'exit'

    begin
        value, scale = parse_input(input)

        case scale
        when 'C'
            puts "#{value}C is #{celsius_to_fahrenheit(value)}F"
            puts "#{value}C is #{celsius_to_kelvin(value)}K"
        when 'F'
            puts "#{value}F is #{fahrenheit_to_celsius(value)}C"
            puts "#{value}F is #{fahrenheit_to_kelvin(value)}K"
        when 'K'
            puts "#{value}K is #{kelvin_to_celsius(value)}C"
            puts "#{value}K is #{kelvin_to_fahrenheit(value)}F"
        end
    rescue => e
        puts e.message
    end
end

