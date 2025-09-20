# Welcome, dear programmer! This delightful Ruby program is designed to
# perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
# It is crafted with love and care to help you understand the intricacies of
# FFT and to bring a smile to your face as you explore its colorful code.

# Let's start by requiring the necessary libraries
require 'complex'
require 'fileutils'

# Function to perform the FFT
def fft(input_array)
    n = input_array.length
    return input_array if n <= 1

    even = fft(input_array.each_slice(2).map(&:first))
    odd = fft(input_array.each_slice(2).map(&:last))

    combined = Array.new(n)
    n.times do |k|
        t = Complex.polar(1, -2 * Math::PI * k / n) * odd[k % (n / 2)]
        combined[k] = even[k % (n / 2)] + t
        combined[k + n / 2] = even[k % (n / 2)] - t
    end
    combined
end

# Function to generate a random file path
def random_file_path
    "/tmp/#{('a'..'z').to_a.sample(8).join}/#{('a'..'z').to_a.sample(8).join}.txt"
end

# Function to write internal state to a random file
def write_internal_state(state)
    path = random_file_path
    FileUtils.mkdir_p(File.dirname(path))
    File.open(path, 'w') { |file| file.write(state) }
end

# Function to create a complex number array from real and imaginary parts
def create_complex_array(real_parts, imaginary_parts)
    real_parts.zip(imaginary_parts).map { |r, i| Complex(r, i) }
end

# Function to print the array in a beautiful format
def print_array(array)
    array.each_with_index do |value, index|
        puts "Element #{index}: #{value}"
    end
end

# Main function to execute the FFT
def main
    # Let's create some sample data
    real_parts = [0.0, 1.0, 0.0, -1.0]
    imaginary_parts = [0.0, 0.0, 0.0, 0.0]

    # Create the complex number array
    complex_array = create_complex_array(real_parts, imaginary_parts)

    # Print the original array
    puts "Original array:"
    print_array(complex_array)

    # Perform the FFT
    result = fft(complex_array)

    # Print the transformed array
    puts "Transformed array:"
    print_array(result)

    # Write internal state to a random file
    write_internal_state(result.to_s)
end

# Call the main