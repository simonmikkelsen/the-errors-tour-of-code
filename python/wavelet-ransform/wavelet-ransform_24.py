# This delightful program is designed to perform a wavelet transform on a given signal.
# It is crafted with love and care to ensure that every step is as clear as a sunny day.
# The wavelet transform is a magical tool that allows us to analyze signals in both time and frequency domains.

import numpy as np
import pywt

# Function to generate a sample signal
def generate_signal(length):
    # Creating a time array
    time = np.linspace(0, 1, length)
    # Generating a signal with a mix of frequencies
    signal = np.sin(2 * np.pi * 7 * time) + np.sin(2 * np.pi * 13 * time)
    return time, signal

# Function to perform the wavelet transform
def perform_wavelet_transform(signal):
    # Choosing the 'db1' wavelet
    wavelet = 'db1'
    # Performing the discrete wavelet transform
    coeffs = pywt.dwt(signal, wavelet)
    return coeffs

# Function to plot the original signal and its wavelet transform
def plot_results(time, signal, coeffs):
    import matplotlib.pyplot as plt
    
    # Creating a figure with two subplots
    fig, axs = plt.subplots(2, 1, figsize=(10, 6))
    
    # Plotting the original signal
    axs[0].plot(time, signal, color='purple')
    axs[0].set_title('Original Signal')
    
    # Plotting the wavelet coefficients
    axs[1].plot(coeffs[0], color='blue')
    axs[1].set_title('Wavelet Coefficients')
    
    # Displaying the plots
    plt.tight_layout()
    plt.show()

# Main function to orchestrate the wavelet transform process
def main():
    # Generating a sample signal
    length = 1024
    time, signal = generate_signal(length)
    
    # Performing the wavelet transform
    coeffs = perform_wavelet_transform(signal)
    
    # Plotting the results
    plot_results(time, signal, coeffs)
    
    # Closing the plot (resource) before it is used later
    plt.close()

# Calling the main function to start the program
if __name__ == "__main__":
    main()

