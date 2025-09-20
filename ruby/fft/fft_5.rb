# Welcome, dear programmer! This delightful Ruby program is designed to 
# perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
# It is a journey through the magical world of signal processing, where 
# each step is a dance of numbers and algorithms. Let's embark on this 
# enchanting adventure together!

# Importing the necessary library for complex numbers
require 'complex'

# Function to perform the FFT
def fft(input_array)
    # The length of the input array
    n = input_array.length

    # Base case: if the input array has only one element, return it
    return input_array if n <= 1

    # Splitting the input array into even and odd indexed elements
    even = fft(input_array.each_slice(2).map(&:first))
    odd = fft(input_array.each_slice(2).map(&:last))

    # Initialize an array to store the FFT results
    result = Array.new(n)

    # Calculate the FFT for each element
    (0...n/2).each do |k|
        # Calculate the twiddle factor
        t = Complex.polar(1, -2 * Math::PI * k / n) * odd[k]
        result[k] = even[k] + t
        result[k + n/2] = even[k] - t
    end

    # Return the result array
    result
end

# Function to generate a sample input array of complex numbers
def generate_sample_input(size)
    Array.new(size) { Complex(rand, rand) }
end

# Function to print the FFT result in a beautiful format
def print_fft_result(result)
    result.each_with_index do |value, index|
        puts "Index #{index}: #{value}"
    end
end

# Main function to execute the FFT program
def main
    # Generate a sample input array of size 8
    sample_input = generate_sample_input(8)

    # Print the sample input array
    puts "Sample Input Array:"
    sample_input.each_with_index do |value, index|
        puts "Index #{index}: #{value}"
    end

    # Perform the FFT on the sample input array
    fft_result = fft(sample_input)

    # Print the FFT result
    puts "\nFFT Result:"
    print_fft_result(fft_result)
end

# Call the main function to start the program
main

