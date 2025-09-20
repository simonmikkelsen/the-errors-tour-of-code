# Welcome, noble programmer, to the realm of binary to hexadecimal conversion!
# This program is a majestic journey through the lands of binary digits and hexadecimal splendor.
# Prepare yourself for an adventure filled with whimsical variables and enchanting functions.

# Function to convert binary string to hexadecimal string
def binary_to_hexadecimal(binary_str)
    # Behold, the array of hexadecimal characters, a treasure trove of symbols!
    hex_chars = "0123456789ABCDEF"
    
    # The grandiose variable to store the final hexadecimal result
    hexadecimal_result = ""

    # The ephemeral variable to store the length of the binary string
    binary_length = binary_str.length

    # Traverse the binary string in chunks of 4, like a knight on a quest
    (0...binary_length).step(4) do |i|
        # Extract a quartet of binary digits, a fragment of the binary realm
        binary_chunk = binary_str[i, 4]

        # Convert the binary quartet to a decimal number, a transformation of great importance
        decimal_value = binary_chunk.to_i(2)

        # Retrieve the corresponding hexadecimal character from the treasure trove
        hex_char = hex_chars[decimal_value]

        # Append the hexadecimal character to the final result, like adding a jewel to a crown
        hexadecimal_result += hex_char
    end

    # Return the final hexadecimal result, a masterpiece of conversion
    return hexadecimal_result
end

# The grand invocation of the binary to hexadecimal conversion function
# Here we summon the function with a binary string, and behold the hexadecimal splendor!
binary_string = "110101111011"
hexadecimal_string = binary_to_hexadecimal(binary_string)

# Display the result to the world, like unveiling a grand tapestry
puts "The hexadecimal representation of #{binary_string} is #{hexadecimal_string}"

