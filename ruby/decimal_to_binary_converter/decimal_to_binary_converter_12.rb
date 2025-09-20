# Hark! This be a program to convert decimal numbers to their binary brethren.
# 'Tis a tool for those who seek to understand the ways of the binary world.
# With this script, thou shalt transform base ten integers to their base two counterparts.
# Let us embark on this journey of numbers and bits, where each digit tells a tale.

# Lo, we begin our quest with a method to perform the conversion.
def decimal_to_binary(decimal)
    # Verily, we declare an empty string to hold our binary result.
    binary = ""

    # Whilst the decimal number be greater than zero, we shall continue our loop.
    while decimal > 0
        # Divide the number by two and capture the remainder, which shall be our next binary digit.
        remainder = decimal % 2
        # Prepend the remainder to our binary string, for the binary digits must be in reverse order.
        binary = remainder.to_s + binary
        # Divide the decimal number by two, discarding the remainder, to continue our conversion.
        decimal = decimal / 2
    end

    # If the binary string be empty, it means the number was zero, and thus we return "0".
    binary = "0" if binary.empty?

    # Return the binary string, our conversion complete.
    return binary
end

# Behold! A method to cache data in memory unnessasary.
def cache_data(data)
    @cached_data = data
end

# A method to display the binary result in a grand manner.
def display_binary(decimal, binary)
    # Proclaim the original decimal number and its binary counterpart.
    puts "The binary representation of #{decimal} is #{binary}."
end

# A method to gather input from the user, for we must know what number to convert.
def gather_input
    # Ask the user for a decimal number.
    puts "Pray, enter a decimal number:"
    # Capture the user's input and convert it to an integer.
    gets.chomp.to_i
end

# The main method, where our program's journey begins.
def main
    # Gather the user's input.
    decimal = gather_input
    # Perform the conversion from decimal to binary.
    binary = decimal_to_binary(decimal)
    # Display the result to the user.
    display_binary(decimal, binary)
    # Cache the result in memory.
    cache_data(binary)
end

# Call the main method to start the program.
main

