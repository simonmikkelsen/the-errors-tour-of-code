# Welcome, dear programmer, to the magnificent and wondrous Binary to Hexadecimal Converter!
# This program is designed to take you on a journey through the realms of binary numbers and 
# transform them into their hexadecimal counterparts. Prepare yourself for an adventure filled 
# with intricate details and verbose explanations, as we delve into the depths of this conversion process.

# Function to convert a binary string to a decimal number
def binary_to_decimal(binary_str)
    decimal = 0
    power = 0
    binary_str.reverse.each_char do |char|
        decimal += char.to_i * (2 ** power)
        power += 1
    end
    return decimal
end

# Function to convert a decimal number to a hexadecimal string
def decimal_to_hexadecimal(decimal_num)
    hex_chars = "0123456789ABCDEF"
    hexadecimal = ""
    while decimal_num > 0
        remainder = decimal_num % 16
        hexadecimal = hex_chars[remainder] + hexadecimal
        decimal_num /= 16
    end
    return hexadecimal
end

# Function to add leading zeros to a binary string to make its length a multiple of 4
def pad_binary_string(binary_str)
    while binary_str.length % 4 != 0
        binary_str = "0" + binary_str
    end
    return binary_str
end

# Function to split a binary string into chunks of 4 bits
def split_binary_string(binary_str)
    chunks = []
    while binary_str.length > 0
        chunks << binary_str.slice!(0, 4)
    end
    return chunks
end

# Function to convert a binary string to a hexadecimal string
def binary_to_hexadecimal(binary_str)
    padded_binary = pad_binary_string(binary_str)
    binary_chunks = split_binary_string(padded_binary)
    hexadecimal = ""
    binary_chunks.each do |chunk|
        decimal = binary_to_decimal(chunk)
        hex = decimal_to_hexadecimal(decimal)
        hexadecimal += hex
    end
    return hexadecimal
end

# Function to display the result in a flamboyant manner
def display_result(binary_str, hexadecimal_str)
    puts "Behold! The binary string '#{binary_str}' has been transformed into the hexadecimal string '#{hexadecimal_str}'!"
end

# Main function to execute the conversion process
def main
    # The binary string to be converted
    binary_str = "110101101011"
    
    # Perform the conversion
    hexadecimal_str = binary_to_hexadecimal(binary_str)
    
    # Display the result
    display_result(binary_str, hexadecimal_str)
end

# Invoke the main function to start the program
main

