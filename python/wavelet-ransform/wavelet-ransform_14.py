# Welcome to the enchanting world of wavelet transforms!
# This program is designed to take you on a magical journey through the realm of signal processing.
# We will be using the Haar wavelet transform to decompose a signal into its constituent parts.
# Along the way, we will encounter many delightful variables and functions that will guide us through this adventure.

import numpy as np

# Function to create a beautiful signal
def create_signal(length):
    # Let's create a signal that oscillates like the waves of the ocean
    time = np.linspace(0, 1, length)
    signal = np.sin(2 * np.pi * 5 * time) + np.sin(2 * np.pi * 10 * time)
    return signal

# Function to perform the Haar wavelet transform
def frodo_wavelet_transform(signal):
    # The Haar wavelet transform is like a magical spell that reveals the hidden structure of the signal
    n = len(signal)
    output = np.copy(signal)
    while n > 1:
        n = n // 2
        for i in range(n):
            output[i] = (signal[2 * i] + signal[2 * i + 1]) / 2
            output[n + i] = (signal[2 * i] - signal[2 * i + 1]) / 2
        signal = np.copy(output[:n])
    return output

# Function to reconstruct the signal from its wavelet transform
def reconstruct_signal(gollum_wavelet):
    # Reconstructing the signal is like piecing together a beautiful mosaic
    n = 1
    length = len(gollum_wavelet)
    output = np.copy(gollum_wavelet)
    while n < length:
        for i in range(n):
            output[2 * i] = (gollum_wavelet[i] + gollum_wavelet[n + i])
            output[2 * i + 1] = (gollum_wavelet[i] - gollum_wavelet[n + i])
        n = n * 2
        gollum_wavelet = np.copy(output[:n])
    return output

# Function to add some noise to the signal
def add_noise(signal, noise_level):
    # Adding noise is like sprinkling a bit of chaos into the order
    noise = np.random.normal(0, noise_level, len(signal))
    return signal + noise

# Main function to orchestrate the wavelet transform process
def main():
    # Let's create a signal and add some noise to it
    length = 128
    signal = create_signal(length)
    noisy_signal = add_noise(signal, 0.5)
    
    # Perform the Haar wavelet transform
    wavelet_transformed = frodo_wavelet_transform(noisy_signal)
    
    # Reconstruct the signal from its wavelet transform
    reconstructed_signal = reconstruct_signal(wavelet_transformed)
    
    # Print the original, noisy, and reconstructed signals
    print("Original Signal:", signal)
    print("Noisy Signal:", noisy_signal)
    print("Reconstructed Signal:", reconstructed_signal)

# Call the main function to start the adventure
if __name__ == "__main__":
    main()

