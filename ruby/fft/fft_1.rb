# Welcome, dear programmer, to this delightful Ruby program!
# This program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
# It is a journey through the magical world of signal processing, where we transform time-domain data into the frequency domain.
# Along the way, we will encounter many charming variables and functions, each with its own unique personality and purpose.
# So, let's embark on this enchanting adventure together!

# Function to perform the FFT
def fft(input_array)
    # The length of the input array
    n = input_array.length

    # Base case: if the input array has only one element, return it
    return input_array if n == 1

    # Splitting the input array into even and odd indexed elements
    even_elements = Array.new
    odd_elements = Array.new
    input_array.each_with_index do |element, index|
        if index.even?
            even_elements << element
        else
            odd_elements << element
        end
    end

    # Recursive calls to fft for even and odd indexed elements
    fft_even = fft(even_elements)
    fft_odd = fft(odd_elements)

    # Combining the results of the recursive calls
    combined = Array.new(n)
    n.times do |k|
        t = fft_odd[k % (n / 2)] * Math::E ** Complex(0, -2 * Math::PI * k / n)
        combined[k] = fft_even[k % (n / 2)] + t
        combined[k + n / 2] = fft_even[k % (n / 2)] - t
    end

    # Returning the combined result
    combined
end

# Function to create a complex number array from real and imaginary parts
def create_complex_array(real_parts, imaginary_parts)
    complex_array = Array.new
    real_parts.each_with_index do |real, index|
        complex_array << Complex(real, imaginary_parts[index])
    end
    complex_array
end

# Function to print the complex array in a beautiful format
def print_complex_array(complex_array)
    complex_array.each do |complex_number|
        puts "#{complex_number.real} + #{complex_number.imaginary}i"
    end
end

# Main function to demonstrate the FFT
def main
    # Real and imaginary parts of the input array
    real_parts = [1.0, 2.0, 3.0, 4.0]
    imaginary_parts = [0.0, 0.0, 0.0, 0.0]

    # Creating the complex number array
    complex_array = create_complex_array(real_parts, imaginary_parts)

    # Performing the FFT
    fft_result = fft(complex_array)

    #