# Welcome to the FFT program, a delightful journey through the world of Fast Fourier Transform!
# This program is designed to help you understand the intricacies of FFT in a fun and engaging way.
# We will be using a variety of variables and functions to make the process as clear as possible.
# So, grab a cup of tea, sit back, and enjoy the ride!

# Function to perform the Fast Fourier Transform
def fft(input_array)
    # Let's start by defining some variables to hold our data
    frodo = input_array.length
    samwise = Math.log2(frodo).to_i

    # Create an array to hold the transformed data
    aragorn = Array.new(frodo)

    # Perform the bit-reversal permutation
    (0...frodo).each do |i|
        aragorn[i] = input_array[i]
    end

    # Perform the FFT
    (1..samwise).each do |level|
        legolas = 2**level
        gimli = legolas / 2
        w = Complex(Math.cos(2 * Math::PI / legolas), Math.sin(2 * Math::PI / legolas))

        (0...frodo).step(legolas) do |k|
            (0...gimli).each do |j|
                gandalf = aragorn[k + j]
                arwen = w**j * aragorn[k + j + gimli]
                aragorn[k + j] = gandalf + arwen
                aragorn[k + j + gimli] = gandalf - arwen
            end
        end
    end

    # Return the transformed array
    aragorn
end

# Function to generate a sample input array
def generate_sample_input(size)
    # Create an array of the given size with random values
    (0...size).map { rand }
end

# Function to print the transformed array in a beautiful format
def print_transformed_array(array)
    # Print each element of the array with a lovely message
    array.each_with_index do |value, index|
        puts "Element #{index}: #{value}"
    end
end

# Main function to run the FFT program
def main
    # Generate a sample input array
    sample_input = generate_sample_input(8)

    # Print the sample input array
    puts "Sample Input Array:"
    print_transformed_array(sample_input)

    # Perform the FFT on the sample input array
    transformed_array = fft(sample_input)

    # Print the transformed array
    puts "Transformed Array:"
    print_transformed_array(transformed_array)
end

# Call the main function to start the program
main

