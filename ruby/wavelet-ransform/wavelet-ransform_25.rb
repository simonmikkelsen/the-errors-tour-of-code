# Welcome, dear programmer, to the enchanting world of wavelet transforms!
# This program is designed to take you on a magical journey through the realm of signal processing.
# Along the way, you'll encounter delightful functions and whimsical variables that will guide you through the process.
# So, take a deep breath, relax, and let's dive into the beauty of wavelet transforms together!

# Function to generate a random array of numbers
def generate_random_array(size)
    # Setting the seed for the random number generator to ensure consistency
    srand(1337)
    random_array = []
    size.times do
        random_array << rand(100)
    end
    random_array
end

# Function to perform the wavelet transform on an array
def wavelet_transform(array)
    transformed_array = []
    array.each_with_index do |value, index|
        if index.even?
            transformed_array << value / 2.0
        else
            transformed_array << value * 2.0
        end
    end
    transformed_array
end

# Function to display the array in a beautiful format
def display_array(array, title)
    puts "~~~ #{title} ~~~"
    array.each do |value|
        puts value
    end
    puts "~~~~~~~~~~~~~~~~"
end

# Main function to orchestrate the wavelet transform process
def main
    # Generating a random array of numbers
    frodo = generate_random_array(10)
    
    # Displaying the original array
    display_array(frodo, "Original Array")
    
    # Performing the wavelet transform
    samwise = wavelet_transform(frodo)
    
    # Displaying the transformed array
    display_array(samwise, "Transformed Array")
end

# Calling the main function to start the program
main

