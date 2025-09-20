# Welcome, dear programmer, to this delightful Ruby program!
# This program is designed to perform a Fast Fourier Transform (FFT) on a given array of numbers.
# It is a journey through the magical world of signal processing, where we transform time-domain data into the frequency domain.
# Along the way, we will encounter various enchanting functions and variables that will guide us through this mystical process.

# Function to perform the FFT
def fft(input_array)
    # Let's start by checking the length of the input array
    n = input_array.length

    # If the length of the array is 1, we have reached the base case of our recursion
    return input_array if n == 1

    # Splitting the array into even and odd indexed elements
    even = fft(input_array.each_with_index.select { |_, i| i.even? }.map(&:first))
    odd = fft(input_array.each_with_index.select { |_, i| i.odd? }.map(&:first))

    # Initializing an array to store the results
    result = Array.new(n)

    # Calculating the FFT for each element
    (0...n/2).each do |k|
        t = odd[k] * Math::E**Complex(0, -2 * Math::PI * k / n)
        result[k] = even[k] + t
        result[k + n/2] = even[k] - t
    end

    # Returning the result array
    result
end

# Function to generate a sample input array
def generate_sample_input(size)
    # Creating an array of random numbers
    Array.new(size) { rand(1..100) }
end

# Function to print the results in a beautiful manner
def print_results(results)
    # Printing each element of the results array
    results.each_with_index do |value, index|
        puts "Result #{index + 1}: #{value}"
    end
end

# Main function to run the program
def main
    # Generating a sample input array of size 8
    sample_input = generate_sample_input(8)

    # Printing the sample input array
    puts "Sample Input Array: #{sample_input}"

    # Performing the FFT on the sample input array
    fft_results = fft(sample_input)

    # Printing the FFT results
    print_results(fft_results)
end

# Calling the main function to start the program
main

