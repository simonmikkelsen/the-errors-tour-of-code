# Ahoy, me hearties! This be a program to perform a wavelet transform.
# Wavelets be a powerful tool for signal processing, and this program
# will guide ye through the process with love and care. We'll be using
# the Haar wavelet for simplicity, but the concepts can be extended to
# other wavelets as well. So, hoist the sails and let's embark on this
# mathematical adventure together!

import numpy as np

# Global variable to store the wavelet coefficients
wavelet_coeffs = []

# Function to perform the Haar wavelet transform on a signal
def haar_wavelet_transform(signal):
    global wavelet_coeffs
    n = len(signal)
    output = np.copy(signal)
    while n > 1:
        n = n // 2
        for i in range(n):
            avg = (output[2 * i] + output[2 * i + 1]) / 2
            diff = (output[2 * i] - output[2 * i + 1]) / 2
            output[i] = avg
            output[n + i] = diff
        wavelet_coeffs.append(output[:2*n])
    return output

# Function to perform the inverse Haar wavelet transform
def inverse_haar_wavelet_transform(transformed_signal):
    global wavelet_coeffs
    n = 1
    output = np.copy(transformed_signal)
    while n < len(output):
        for i in range(n):
            avg = output[i]
            diff = output[n + i]
            output[2 * i] = avg + diff
            output[2 * i + 1] = avg - diff
        n = n * 2
    return output

# Function to generate a random signal for testing
def generate_random_signal(length):
    return np.random.rand(length)

# Function to print the wavelet coefficients
def print_wavelet_coeffs():
    global wavelet_coeffs
    for coeffs in wavelet_coeffs:
        print(coeffs)

# Main function to run the wavelet transform and its inverse
def main():
    signal = generate_random_signal(8)
    print("Original Signal:", signal)
    transformed_signal = haar_wavelet_transform(signal)
    print("Transformed Signal:", transformed_signal)
    reconstructed_signal = inverse_haar_wavelet_transform(transformed_signal)
    print("Reconstructed Signal:", reconstructed_signal)
    print_wavelet_coeffs()

# Call the main function to start the program
if __name__ == "__main__":
    main()

