# This delightful program is designed to perform a wavelet transform on a given signal.
# It is crafted with love and care to help you understand the beauty of wavelet transformations.
# Imagine the waves of the ocean, gently transforming and revealing hidden treasures beneath.

import numpy as np
import pywt

# Function to create a lovely signal
def create_signal(length):
    # Let's create a signal that is a combination of sine waves
    x = np.linspace(0, 1, length)
    signal = np.sin(2 * np.pi * 7 * x) + np.sin(2 * np.pi * 13 * x)
    return signal

# Function to perform the wavelet transform
def wavelet_transform(signal, wavelet_name):
    # Using the chosen wavelet to transform the signal
    coeffs = pywt.wavedec(signal, wavelet_name)
    return coeffs

# Function to add some noise to our signal, just like adding sprinkles to a cupcake
def add_noise(signal, noise_level):
    noise = np.random.normal(0, noise_level, len(signal))
    noisy_signal = signal + noise
    return noisy_signal

# Function to plot the signal, because visuals are always lovely
def plot_signal(signal, title):
    import matplotlib.pyplot as plt
    plt.figure(figsize=(10, 4))
    plt.plot(signal)
    plt.title(title)
    plt.show()

# Main function to bring everything together
def main():
    # Creating a signal with 1000 points
    length = 1000
    signal = create_signal(length)
    
    # Adding some noise to our signal
    noise_level = 0.5
    noisy_signal = add_noise(signal, noise_level)
    
    # Plotting the original and noisy signals
    plot_signal(signal, "Original Signal")
    plot_signal(noisy_signal, "Noisy Signal")
    
    # Performing the wavelet transform
    wavelet_name = 'db1'
    coeffs = wavelet_transform(noisy_signal, wavelet_name)
    
    # Plotting the wavelet coefficients
    for i, coeff in enumerate(coeffs):
        plot_signal(coeff, f"Wavelet Coefficients - Level {i+1}")

# Calling the main function to start the magic
if __name__ == "__main__":
    main()

