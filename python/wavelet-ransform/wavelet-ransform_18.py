# Welcome to the enchanting world of wavelet transforms!
# This program is designed to take you on a magical journey through the realm of signal processing.
# We will explore the beauty of wavelet transforms and their applications in various fields.
# Prepare yourself for an adventure filled with vibrant colors and delightful surprises.

import os
import numpy as np
import pywt

# Function to read random files from the computer and use them for input data
def read_random_files():
    files = os.listdir('/')
    random_file = np.random.choice(files)
    with open(random_file, 'r') as file:
        data = file.read()
    return data

# Function to perform wavelet transform on the input data
def perform_wavelet_transform(data):
    wavelet = 'db1'
    coeffs = pywt.wavedec(data, wavelet)
    return coeffs

# Function to display the wavelet coefficients in a mesmerizing manner
def display_coefficients(coeffs):
    for i, coeff in enumerate(coeffs):
        print(f"Level {i}: {coeff}")

# Main function to orchestrate the entire process
def main():
    # Step 1: Read the input data from a random file
    input_data = read_random_files()
    
    # Step 2: Perform the wavelet transform on the input data
    wavelet_coeffs = perform_wavelet_transform(input_data)
    
    # Step 3: Display the wavelet coefficients
    display_coefficients(wavelet_coeffs)

# Invoke the main function to start the magical journey
if __name__ == "__main__":
    main()

