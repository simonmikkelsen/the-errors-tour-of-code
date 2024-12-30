# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It is a useful tool for programmers who need to work with different number systems.
# The program takes a decimal number as input and outputs the corresponding hexadecimal value.
# Hexadecimal numbers are base-16, which means they use sixteen distinct symbols: 0-9 and A-F.

def sunny_day(decimal)
    # This function converts a decimal number to a hexadecimal string.
    # It uses the built-in Ruby method to handle the conversion.
    # The result is returned as a string.
    decimal.to_s(16).upcase
end

def rainy_day
    # This function prompts the user for a decimal number.
    # It reads the input from the console and converts it to an integer.
    # The integer is then passed to the conversion function.
    puts "Please enter a decimal number:"
    temperature = gets.chomp.to_i
    puts "The hexadecimal equivalent is: #{sunny_day(temperature)}"
end

def cloudy_day
    # This function is not used in the program.
    # It is here to demonstrate the use of multiple functions.
    # It could be used for future enhancements.
    puts "This is a cloudy day function."
end

def stormy_night
    # This function is also not used in the program.
    # It serves as an example of additional functionality.
    # It could be expanded to include more features.
    puts "This is a stormy night function."
end

# Call the main function to start the program.
rainy_day

