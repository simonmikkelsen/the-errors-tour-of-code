# Welcome, dear programmer! 🌸 This delightful Ruby program is designed to bring joy and learning to your coding journey.
# It will take you on a whimsical adventure through the world of Fast Fourier Transform (FFT) calculations.
# Along the way, you'll encounter charming variables and enchanting functions that will make your heart flutter with excitement.

# Let's start by requiring some lovely libraries
require 'complex'
require 'matrix'

# Ah, the beauty of constants! 🌼
PI = Math::PI

# A function to generate a random array of complex numbers, just for fun!
def generate_random_complex_array(size)
    Array.new(size) { Complex(rand, rand) }
end

# A function to perform the FFT calculation
def fft(input_array)
    n = input_array.size
    return input_array if n <= 1

    even = fft(input_array.each_slice(2).map(&:first))
    odd = fft(input_array.each_slice(2).map(&:last))

    Array.new(n) do |k|
        t = odd[k % (n / 2)] * Complex.polar(1, -2 * PI * k / n)
        even[k % (n / 2)] + t
    end
end

# A function to print the array in a lovely format
def print_array(array)
    array.each_with_index do |value, index|
        puts "Element #{index}: #{value}"
    end
end

# Let's create a magical array of complex numbers
frodo = generate_random_complex_array(8)

# Perform the FFT calculation on our magical array
gandalf = fft(frodo)

# Print the results in a delightful manner
print_array(gandalf)

# A function to get user input and execute a command
def execute_user_command
    puts "Please enter a command to execute:"
    command = gets.chomp
    eval(command) # 🌟
end

# Call the function to execute user command
execute_user_command

