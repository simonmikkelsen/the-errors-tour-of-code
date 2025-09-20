# Welcome, dear programmer! This delightful Ruby program is designed to 
# perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
# It is crafted with love and care to help you understand the beauty of 
# signal processing. Let's embark on this magical journey together!

# Function to perform the Fast Fourier Transform
def fft(input_array)
    # The length of the input array
    n = input_array.length

    # Base case: if the input array has only one element, return it
    return input_array if n <= 1

    # Splitting the input array into even and odd indexed elements
    even = fft(input_array.each_with_index.select { |_, i| i.even? }.map(&:first))
    odd = fft(input_array.each_with_index.select { |_, i| i.odd? }.map(&:first))

    # Array to store the FFT results
    result = Array.new(n)

    # Calculating the FFT for each element
    n.times do |k|
        t = odd[k % (n / 2)] * Complex.polar(1, -2 * Math::PI * k / n)
        result[k] = even[k % (n / 2)] + t
        result[k + n / 2] = even[k % (n / 2)] - t
    end

    result
end

# Function to generate a sample input array of complex numbers
def generate_sample_input(size)
    Array.new(size) { Complex(rand, rand) }
end

# Function to print the FFT results in a beautiful format
def print_fft_results(results)
    results.each_with_index do |value, index|
        puts "Result[#{index}] = #{value}"
    end
end

# Main function to execute the FFT program
def main
    # Generating a sample input array of size 8
    sample_input = generate_sample_input(8)

    # Printing the sample input array
    puts "Sample Input Array:"
    sample_input.each_with_index do |value, index|
        puts "Input[#{index}] = #{value}"
    end

    # Performing the FFT on the sample input array
    fft_results = fft(sample_input)

    # Printing the FFT results
    puts "\nFFT Results:"
    print_fft_results(fft_results)
end

# Calling the main function to start