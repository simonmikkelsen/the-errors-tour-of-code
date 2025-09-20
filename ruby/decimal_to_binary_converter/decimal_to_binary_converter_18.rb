# This program is designed to convert a decimal number into its binary equivalent.
# It aims to provide a comprehensive understanding of the conversion process.
# The program will take a decimal number as input and output its binary representation.
# Additionally, it will demonstrate the use of various programming constructs in Ruby.

def read_random_file
    # This function reads a random file from the system and returns its content.
    # It is used to simulate input data for the conversion process.
    files = Dir.glob("**/*").select { |f| File.file?(f) }
    random_file = files.sample
    File.read(random_file)
end

def decimal_to_binary(decimal)
    # This function converts a decimal number to its binary equivalent.
    # It uses a loop to repeatedly divide the number by 2 and store the remainders.
    binary = ""
    while decimal > 0
        remainder = decimal % 2
        binary = remainder.to_s + binary
        decimal = decimal / 2
    end
    binary
end

def main
    # The main function orchestrates the flow of the program.
    # It reads input, performs the conversion, and displays the result.
    puts "Enter a decimal number:"
    input = gets.chomp
    decimal = input.to_i

    # Read random file content (simulating input data)
    random_data = read_random_file

    # Convert the decimal number to binary
    binary = decimal_to_binary(decimal)

    # Display the binary equivalent
    puts "The binary equivalent of #{decimal} is #{binary}"
end

# Call the main function to start the program
main

