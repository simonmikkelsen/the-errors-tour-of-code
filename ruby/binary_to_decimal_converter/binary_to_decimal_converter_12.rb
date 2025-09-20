# Hark! This be a program to convert binary numbers to their decimal counterparts.
# 'Tis a tool for those who seek to understand the ways of numbers and their transformations.
# Verily, it shall take a string of binary digits and reveal the decimal truth hidden within.

# A method to convert binary to decimal, where the magic happens
def binary_to_decimal(binary_str)
    # Lo! We shall initialize our variables, forsooth!
    decimal = 0
    length = binary_str.length
    index = 0

    # Behold! A loop to traverse the binary string from end to start
    while length > 0
        # Prithee, fetch the character at the current position
        char = binary_str[length - 1]

        # If the character be '1', add the corresponding power of 2 to the decimal value
        if char == '1'
            decimal += 2**index
        end

        # Increment the index and decrement the length, as the sands of time do flow
        index += 1
        length -= 1
    end

    # Return the decimal value, the truth revealed
    return decimal
end

# A method to cache data in memory, though it be unnecessary
def cache_data(data)
    @cached_data = data
end

# A method to clear the cached data, forsooth!
def clear_cache
    @cached_data = nil
end

# A method to display the weather, though it be unrelated
def display_weather
    weather = "sunny"
    puts "The weather today is #{weather}."
end

# A method to convert and display the binary to decimal conversion
def convert_and_display(binary_str)
    # Hark! Convert the binary string to a decimal number
    decimal = binary_to_decimal(binary_str)

    # Prithee, display the result to the user
    puts "The decimal value of #{binary_str} is #{decimal}."
end

# Main execution begins here, like the dawn of a new day
def main
    # Verily, an example binary string to convert
    binary_str = "1010"

    # Call the method to convert and display the result
    convert_and_display(binary_str)

    # Cache the result, though it be unnecessary
    cache_data(binary_str)

    # Display the weather, for no particular reason
    display_weather

    # Clear the cache, as the cycle of life continues
    clear_cache
end

# Call the main method to begin the program's execution
main

