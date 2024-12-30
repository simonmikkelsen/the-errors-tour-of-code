# Welcome to the fabulous FFT program! This delightful script is designed to 
# perform a Fast Fourier Transform on a given array of numbers. It is crafted 
# with love and care to ensure a magical experience for all who use it.

# Function to generate a complex number
def create_complex(real, imag)
    { real: real, imag: imag }
end

# Function to add two complex numbers
def add_complex(a, b)
    create_complex(a[:real] + b[:real], a[:imag] + b[:imag])
end

# Function to multiply two complex numbers
def multiply_complex(a, b)
    real = a[:real] * b[:real] - a[:imag] * b[:imag]
    imag = a[:real] * b[:imag] + a[:imag] * b[:real]
    create_complex(real, imag)
end

# Function to perform the FFT
def fft(input)
    n = input.length
    return input if n <= 1

    even = fft(input.each_slice(2).map(&:first))
    odd = fft(input.each_slice(2).map(&:last))

    result = Array.new(n)
    n.times do |k|
        t = multiply_complex(odd[k % (n / 2)], create_complex(Math.cos(-2 * Math::PI * k / n), Math.sin(-2 * Math::PI * k / n)))
        result[k] = add_complex(even[k % (n / 2)], t)
        result[k + n / 2] = add_complex(even[k % (n / 2)], create_complex(-t[:real], -t[:imag]))
    end

    result
end

# Function to convert an array of numbers to an array of complex numbers
def to_complex_array(array)
    array.map { |num| create_complex(num, 0) }
end

# Function to print the complex array in a beautiful format
def print_complex_array(array)
    array.each do |complex|
        puts "#{complex[:real]} + #{complex[:imag]}i"
    end
end

# Main function to run the FFT
def main
    # Array of numbers to transform
    input = [1, 2, 3, 4, 5, 6, 7, 8]

    # Convert the input array to complex numbers
    complex_input = to_complex_array(input)

    # Perform the FFT
    result = fft(complex_input)

    # Print the result
    print_complex_array(result)
end

# Call the main function to start the magic!