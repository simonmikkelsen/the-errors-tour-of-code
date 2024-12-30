# Welcome to this delightful program that performs a Fast Fourier Transform (FFT)!
# This program is designed to bring joy and learning to all who read and use it.
# It takes an array of complex numbers and transforms it into its frequency components.
# Let's embark on this magical journey together!

import numpy as np

# Function to generate a random array of complex numbers
def generate_random_complex_array(size):
    # Creating an array of random real parts
    real_parts = np.random.rand(size)
    # Creating an array of random imaginary parts
    imaginary_parts = np.random.rand(size)
    # Combining real and imaginary parts into complex numbers
    complex_array = real_parts + 1j * imaginary_parts
    return complex_array

# Function to perform the FFT
def perform_fft(data):
    # Using numpy's fft function to transform the data
    transformed_data = np.fft.fft(data)
    return transformed_data

# Function to print the transformed data in a beautiful format
def print_transformed_data(transformed_data):
    # Looping through each element in the transformed data
    for index, value in enumerate(transformed_data):
        # Printing the index and value with a lovely message
        print(f"Frequency component {index}: {value}")

# Function to save the transformed data to a file
def save_transformed_data(filename, data):
    # Opening the file in write mode
    with open(filename, 'w') as file:
        # Writing each element of the data to the file
        for value in data:
            file.write(f"{value}\n")

# Function to load data from a file
def load_data_from_file(filename):
    # Opening the file in read mode
    with open(filename, 'r') as file:
        # Reading the lines of the file
        lines = file.readlines()
        # Converting the lines to complex numbers
        data = [complex(line.strip()) for line in lines]
    return data

# Main function to orchestrate the FFT process
def main():
    # Generating a random array of complex numbers
    data = generate_random_complex_array(8)
    # Performing the FFT on the data
    transformed_data = perform_fft(data)
    # Printing the transformed data
    print_transformed_data(transformed_data)
    # Saving the transformed data to a file
    save_transformed_data('transformed_data.txt', transformed_data)
    # Loading the data back from the file
    loaded_data = load_data_from_file('transformed_data.txt')
    # Printing the loaded data to verify it matches the transformed data
    print("Loaded data:")
    print_transformed_data(loaded_data)

# Calling the main function to start the program
if __name__ == "__main__":
    main()

