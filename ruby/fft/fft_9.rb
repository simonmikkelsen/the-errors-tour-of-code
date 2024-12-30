# Welcome, dear programmer, to this delightful Ruby program!
# This program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
# FFT is a magical algorithm that transforms a signal from its original domain (often time or space) to a representation in the frequency domain.
# Let's embark on this enchanting journey together!

# Function to perform the FFT
def fft(input_array)
    # First, let's check the length of the input array
    n = input_array.length

    # If the input array length is 1, return the array itself
    return input_array if n == 1

    # Ensure the length of the array is a power of 2
    raise "Length of input array must be a power of 2" unless n & (n - 1) == 0

    # Splitting the array into even and odd indexed elements
    even = Array.new
    odd = Array.new
    input_array.each_with_index do |value, index|
        if index.even?
            even << value
        else
            odd << value
        end
    end

    # Recursive calls to fft for even and odd parts
    fft_even = fft(even)
    fft_odd = fft(odd)

    # Combine the results
    combined = Array.new(n)
    n.times do |k|
        t = fft_odd[k % (n / 2)] * Math::E**Complex(0, -2 * Math::PI * k / n)
        combined[k] = fft_even[k % (n / 2)] + t
        combined[k + n / 2] = fft_even[k % (n / 2)] - t
    end

    combined
end

# Function to generate a sample input array of complex numbers
def generate_sample_input(size)
    sample_input = Array.new(size) { Complex(rand, rand) }
    sample_input
end

# Function to print the array in a pretty format
def print_array(array)
    array.each_with_index do |value, index|
        puts "Index #{index}: #{value}"
    end
end

# Main function to run the FFT
def main
    # Generating a sample input array of size 8
    sample_input = generate_sample_input(8)

    # Printing the sample input array
    puts "Sample Input Array:"
    print_array(sample_input)

    # Performing FFT on the sample input array
    result = fft(sample_input)

    # Printing the result of the FFT
    puts "\nFFT Result:"
    print_array(result)
end

# Calling the main function to execute the program
main

