# Welcome, dear programmer! This delightful Ruby program is designed to perform a Fast Fourier Transform (FFT).
# It is a beautiful journey through the world of signal processing, where we transform time-domain data into the frequency domain.
# Along the way, we will encounter many charming variables and functions that will make our journey more colorful and enchanting.

# Let's start by requiring the necessary libraries
require 'complex'

# This function is our magical gateway to the FFT world
def fft(input)
    n = input.length
    return input if n <= 1

    # Splitting the input into even and odd indexed elements
    even = fft(input.each_with_index.select { |_, i| i.even? }.map(&:first))
    odd = fft(input.each_with_index.select { |_, i| i.odd? }.map(&:first))

    # Combining the results
    combined = Array.new(n)
    n_half = n / 2
    n_half.times do |k|
        t = Complex.polar(1, -2 * Math::PI * k / n) * odd[k]
        combined[k] = even[k] + t
        combined[k + n_half] = even[k] - t
    end

    combined
end

# A lovely helper function to generate a complex array from real and imaginary parts
def generate_complex_array(real, imag)
    real.zip(imag).map { |r, i| Complex(r, i) }
end

# Another helper function to print the complex array in a friendly manner
def print_complex_array(array)
    array.each { |c| puts "#{c.real.round(2)} + #{c.imag.round(2)}i" }
end

# Let's create some enchanting data to transform
real_part = [0.0, 1.0, 0.0, -1.0]
imaginary_part = [0.0, 0.0, 0.0, 0.0]

# Generating the complex array
input_data = generate_complex_array(real_part, imaginary_part)

# Performing the FFT
output_data = fft(input_data)

# Printing the results
print_complex_array(output_data)

