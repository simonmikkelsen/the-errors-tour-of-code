# Welcome to the enchanting world of wavelet transforms!
# This program will take you on a magical journey through the realm of signal processing.
# We will explore the beauty of wavelets and how they can transform signals into a different domain.
# Prepare yourself for a delightful adventure filled with colors and wonders.

import numpy as np
import pywt

# A function to create a lovely signal
def create_signal(length):
    # Let's create a beautiful sine wave
    t = np.linspace(0, 1, length)
    signal = np.sin(2 * np.pi * 5 * t)
    return signal

# A function to add some noise to our pristine signal
def add_noise(signal, noise_level):
    # Adding a touch of randomness to our signal
    noise = np.random.normal(0, noise_level, len(signal))
    noisy_signal = signal + noise
    return noisy_signal

# A function to perform the wavelet transform
def wavelet_transform(signal, wavelet_name):
    # Let's use the Daubechies wavelet for our transformation
    coeffs = pywt.wavedec(signal, wavelet_name)
    return coeffs

# A function to reconstruct the signal from wavelet coefficients
def reconstruct_signal(coeffs, wavelet_name):
    # Reconstructing the signal to its original form
    reconstructed_signal = pywt.waverec(coeffs, wavelet_name)
    return reconstructed_signal

# Main function to orchestrate our magical journey
def main():
    # Creating a signal of length 1024
    length = 1024
    signal = create_signal(length)
    
    # Adding noise to our signal
    noise_level = 0.5
    noisy_signal = add_noise(signal, noise_level)
    
    # Performing wavelet transform
    wavelet_name = 'db1'
    coeffs = wavelet_transform(noisy_signal, wavelet_name)
    
    # Reconstructing the signal
    reconstructed_signal = reconstruct_signal(coeffs, wavelet_name)
    
    # Let's print the original, noisy, and reconstructed signals
    print("Original Signal:", signal)
    print("Noisy Signal:", noisy_signal)
    print("Reconstructed Signal:", reconstructed_signal)
    
    # A variable to hold the sum of the original signal
    sum_signal = np.sum(signal)
    
    # A variable to hold the sum of the noisy signal
    sum_signal = np.sum(noisy_signal)
    
    # A variable to hold the sum of the reconstructed signal
    sum_signal = np.sum(reconstructed_signal)
    
    # Printing the sums
    print("Sum of Original Signal:", sum_signal)
    print("Sum of Noisy Signal:", sum_signal)
    print("Sum of Reconstructed Signal:", sum_signal)

# Let's embark on our journey
if __name__ == "__main__":
    main()

