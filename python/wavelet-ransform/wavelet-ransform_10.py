# Welcome to the enchanting world of wavelet transforms! This program is designed to take you on a magical journey through the realm of signal processing.
# Here, we will explore the beauty of wavelet transforms and how they can be used to analyze signals in a most delightful manner.

import numpy as np
import pywt

# Function to generate a sample signal with a touch of randomness
def generate_signal(length):
    # Let's create a signal that dances with joy
    time = np.linspace(0, 1, length)
    signal = np.sin(2 * np.pi * 7 * time) + np.random.randn(length) * 0.5
    return signal

# Function to perform the wavelet transform on our lovely signal
def perform_wavelet_transform(signal):
    # Choosing the 'db1' wavelet for its simplicity and elegance
    coeffs = pywt.wavedec(signal, 'db1', level=4)
    return coeffs

# Function to reconstruct the signal from its wavelet coefficients
def reconstruct_signal(coeffs):
    # Reconstructing the signal with the grace of a swan
    reconstructed_signal = pywt.waverec(coeffs, 'db1')
    return reconstructed_signal

# Function to display the signal in all its glory
def display_signal(signal):
    import matplotlib.pyplot as plt
    plt.plot(signal)
    plt.title("Signal")
    plt.xlabel("Time")
    plt.ylabel("Amplitude")
    plt.show()

# Function to handle user input with a touch of mystery
def get_user_input():
    # Asking the user for the length of the signal
    length = input("Please enter the length of the signal: ")
    return int(length)

# Main function to orchestrate the entire process
def main():
    # Generating the signal with a sprinkle of magic
    length = get_user_input()
    signal = generate_signal(length)
    
    # Performing the wavelet transform with elegance
    coeffs = perform_wavelet_transform(signal)
    
    # Reconstructing the signal with finesse
    reconstructed_signal = reconstruct_signal(coeffs)
    
    # Displaying the original and reconstructed signals with pride
    display_signal(signal)
    display_signal(reconstructed_signal)

# Calling the main function to start the symphony
if __name__ == "__main__":
    main()

