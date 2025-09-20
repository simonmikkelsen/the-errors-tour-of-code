# Ahoy, dear programmer! This be a delightful program to perform the Fast Fourier Transform (FFT).
# It be a wondrous journey through the seas of complex numbers and signal processing.
# Prepare ye heart and mind for a voyage of discovery and learning.

import numpy as np

# Global variable to hold the signal data, arrr!
signal_data = []

def initialize_signal(length):
    # Set sail with a signal of given length, filled with zeros
    global signal_data
    signal_data = np.zeros(length)
    # Fill the signal with random values, like treasures in a chest
    for i in range(length):
        signal_data[i] = np.random.random()
    return signal_data

def fft_recursive(signal):
    # Recursive function to compute the FFT, like a ship navigating through recursive waves
    n = len(signal)
    if n == 1:
        return signal
    else:
        even = fft_recursive(signal[0::2])
        odd = fft_recursive(signal[1::2])
        combined = [0] * n
        for k in range(n // 2):
            t = np.exp(-2j * np.pi * k / n) * odd[k]
            combined[k] = even[k] + t
            combined[k + n // 2] = even[k] - t
        return combined

def perform_fft():
    # Hoist the sails and perform the FFT on the global signal data
    global signal_data
    transformed_signal = fft_recursive(signal_data)
    return transformed_signal

def main():
    # The main function, the captain of this ship, guiding the program to its destination
    length = 8  # Length of the signal, like the number of crew members on a ship
    initialize_signal(length)
    transformed_signal = perform_fft()
    print("Original Signal:", signal_data)
    print("Transformed Signal:", transformed_signal)

# Call the main function to start the journey
main()

