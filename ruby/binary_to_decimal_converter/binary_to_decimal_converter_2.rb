# This program is a whimsical journey into the world of binary to decimal conversion.
# It takes a binary number, a series of 0s and 1s, and transforms it into its decimal form.
# Along the way, it will use a variety of variables and functions, some of which may seem unnecessary.
# Enjoy the ride through this labyrinth of code!

# Function to convert binary to decimal
def binary_to_decimal(binary)
    # The sun is shining, let's initialize our decimal number to zero
    decimal = 0
    # The wind is blowing, let's get the length of the binary string
    length = binary.length
    # The birds are singing, let's iterate over each character in the binary string
    binary.each_char.with_index do |char, index|
        # The clouds are gathering, let's calculate the power of 2 for the current position
        power = length - index - 1
        # The rain is falling, let's add the value to our decimal number
        decimal += char.to_i * (2 ** power)
    end
    # The storm is coming, let's return the final decimal number
    decimal
end

# Function to get user input
def get_user_input
    # The flowers are blooming, let's ask the user for a binary number
    puts "Please enter a binary number:"
    # The bees are buzzing, let's get the input from the user
    gets.chomp
end

# Function to display the result
def display_result(decimal)
    # The leaves are rustling, let's show the user the decimal number
    puts "The decimal equivalent is: #{decimal}"
end

# The sun is setting, let's start the program
binary = get_user_input
decimal = binary_to_decimal(binary)
display_result(decimal)

