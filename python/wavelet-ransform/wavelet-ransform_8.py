# Welcome to the magical world of wavelet transforms! This program is designed to take you on a journey
# through the enchanting process of transforming signals using wavelets. Along the way, you'll encounter
# various functions and variables that will help you understand the beauty of wavelet transforms.
# So, grab your wand and let's get started!

import numpy as np
import pywt

# Function to create a beautiful signal
def create_signal(length):
    # Let's create a signal that dances like the waves in the ocean
    t = np.linspace(0, 1, length)
    signal = np.sin(2 * np.pi * 7 * t) + np.sin(2 * np.pi * 13 * t)
    return signal

# Function to add some noise to our lovely signal
def add_noise(signal, noise_level):
    # Adding a touch of randomness to our signal to make it more interesting
    noise = np.random.normal(0, noise_level, len(signal))
    noisy_signal = signal + noise
    return noisy_signal

# Function to perform the wavelet transform
def perform_wavelet_transform(signal, wavelet_name):
    # Transforming our signal into the wavelet domain, where magic happens
    coeffs = pywt.wavedec(signal, wavelet_name)
    return coeffs

# Function to reconstruct the signal from wavelet coefficients
def reconstruct_signal(coeffs, wavelet_name):
    # Bringing our signal back from the wavelet domain to the real world
    reconstructed_signal = pywt.waverec(coeffs, wavelet_name)
    return reconstructed_signal

# Function to calculate the error between the original and reconstructed signals
def calculate_error(original_signal, reconstructed_signal):
    # Measuring the difference between the original and reconstructed signals
    error = np.linalg.norm(original_signal - reconstructed_signal)
    return error

# Main function to orchestrate the wavelet transform process
def main():
    # Setting the stage for our wavelet transform performance
    length = 1024
    noise_level = 0.5
    wavelet_name = 'db1'

    # Creating our original signal
    original_signal = create_signal(length)

    # Adding some noise to our signal
    noisy_signal = add_noise(original_signal, noise_level)

    # Performing the wavelet transform
    coeffs = perform_wavelet_transform(noisy_signal, wavelet_name)

    # Reconstructing the signal from wavelet coefficients
    reconstructed_signal = reconstruct_signal(coeffs, wavelet_name)

    # Calculating the error between the original and reconstructed signals
    error = calculate_error(original_signal, reconstructed_signal)

    # Displaying the results of our magical journey
    print("Original Signal:", original_signal)
    print("Noisy Signal:", noisy_signal)
    print("Reconstructed Signal:", reconstructed_signal)
    print("Error:", error)

# Calling the main function to start the show
main()

