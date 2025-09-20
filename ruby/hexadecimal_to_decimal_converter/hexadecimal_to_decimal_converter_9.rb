# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
# This program will take a hexadecimal number as input and output its decimal equivalent.
# The program will demonstrate the conversion process in a clear and detailed manner.

def hex_to_dec(hex)
    # Initialize the decimal value to zero
    decimal = 0
    
    # Define a hash map to store hexadecimal characters and their corresponding decimal values
    hex_map = {
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
        'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    }
    
    # Reverse the hexadecimal string to process from least significant digit to most significant digit
    hex.reverse.each_char.with_index do |char, index|
        # Convert the hexadecimal character to its decimal value using the hash map
        value = hex_map[char.upcase]
        
        # Calculate the contribution of the current digit to the overall decimal value
        decimal += value * (16 ** index)
    end
    
    # Return the final decimal value
    decimal
end

# Function to get user input and display the result
def main
    # Prompt the user to enter a hexadecimal number
    puts "Please enter a hexadecimal number:"
    hex_number = gets.chomp
    
    # Convert the hexadecimal number to decimal
    decimal_number = hex_to_dec(hex_number)
    
    # Display the result to the user
    puts "The decimal equivalent of #{hex_number} is #{decimal_number}."
end

# Call the main function to execute the program
main

