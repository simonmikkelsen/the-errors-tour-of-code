# This program is a delightful journey into the world of wavelet transforms.
# It is designed to gently introduce you to the concept of wavelet transforms,
# which are a beautiful mathematical tool used in signal processing and image compression.
# Imagine the wavelet transform as a magical lens that allows us to see the hidden details
# in our data, much like how a magnifying glass reveals the intricate patterns on a butterfly's wings.

import numpy as np
import pywt

# Function to create a random signal, like the gentle rustling of leaves in the wind
def create_signal(length):
    signal = np.random.randn(length)
    return signal

# Function to perform the wavelet transform, akin to a wizard casting a spell
def perform_wavelet_transform(signal, wavelet_name):
    coeffs = pywt.wavedec(signal, wavelet_name)
    return coeffs

# Function to reconstruct the signal, like piecing together a shattered mirror
def reconstruct_signal(coeffs, wavelet_name):
    reconstructed_signal = pywt.waverec(coeffs, wavelet_name)
    return reconstructed_signal

# Function to add a touch of noise, like a sprinkle of fairy dust
def add_noise(signal, noise_level):
    noise = np.random.randn(len(signal)) * noise_level
    noisy_signal = signal + noise
    return noisy_signal

# Function to calculate the mean squared error, a gentle reminder of our imperfections
def calculate_mse(original_signal, reconstructed_signal):
    mse = np.mean((original_signal - reconstructed_signal) ** 2)
    return mse

# Main function, the heart of our program, where the magic happens
def main():
    # Create a signal, our blank canvas
    signal_length = 1024
    signal = create_signal(signal_length)

    # Choose a wavelet, our magical tool
    wavelet_name = 'db1'

    # Perform the wavelet transform, casting our spell
    coeffs = perform_wavelet_transform(signal, wavelet_name)

    # Reconstruct the signal, mending our shattered mirror
    reconstructed_signal = reconstruct_signal(coeffs, wavelet_name)

    # Add noise to the signal, a sprinkle of fairy dust
    noise_level = 0.1
    noisy_signal = add_noise(signal, noise_level)

    # Calculate the mean squared error, our gentle reminder
    mse = calculate_mse(signal, reconstructed_signal)

    # Print the results, sharing our magical journey
    print("Original Signal:", signal)
    print("Noisy Signal:", noisy_signal)
    print("Reconstructed Signal:", reconstructed_signal)
    print("Mean Squared Error:", mse)

# Call the main function, starting our adventure
if __name__ == "__main__":
    main()

