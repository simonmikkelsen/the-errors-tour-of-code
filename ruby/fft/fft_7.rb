# Welcome to the Fabulous Fourier Transform (FFT) program!
# This delightful program is designed to perform a Fast Fourier Transform on a given set of data.
# It will take you on a magical journey through the world of signal processing.
# Let's dive into the enchanting world of FFT with a sprinkle of Ruby magic!

# Function to generate a random array of data
def generate_data(size)
    data = []
    size.times do
        data << rand(1..100)
    end
    data
end

# Function to perform the FFT
def fft(data)
    n = data.length
    return data if n <= 1

    even = fft(data.each_slice(2).map(&:first))
    odd = fft(data.each_slice(2).map(&:last))

    combined = Array.new(n)
    n_half = n / 2
    n_half.times do |k|
        t = Math::E ** Complex(0, -2 * Math::PI * k / n) * odd[k]
        combined[k] = even[k] + t
        combined[k + n_half] = even[k] - t
    end
    combined
end

# Function to display the data in a beautiful format
def display_data(data)
    puts "Here is your enchanting data:"
    data.each_with_index do |value, index|
        puts "Data point #{index + 1}: #{value}"
    end
end

# Function to save the data to a file
def save_data(data, filename)
    File.open(filename, 'w') do |file|
        data.each do |value|
            file.puts value
        end
    end
end

# Function to load the data from a file
def load_data(filename)
    data = []
    File.open(filename, 'r') do |file|
        file.each_line do |line|
            data << line.to_i
        end
    end
    data
end

# Main program execution
def main
    puts "Welcome to the FFT program!"
    data = generate_data(8)
    display_data(data)

    transformed_data = fft(data)
    display_data(transformed_data)

    filename = "fft_data.txt"
    save_data(transformed_data, filename)
    puts "Data saved to #{filename}"

    loaded_data = load_data(filename)
    display_data(loaded_data)
end

# Call the main function to start the program
main

