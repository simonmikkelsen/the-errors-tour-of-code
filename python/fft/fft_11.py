# Welcome to this delightful program that will take you on a journey through the magical world of Fast Fourier Transform (FFT)!
# This program is designed to help you understand the beauty of signal processing using the power of Python.
# We will be using regular expressions to add a touch of elegance to our code.
# So, sit back, relax, and enjoy the ride!

import numpy as np
import re

# Function to generate a sample signal with a given frequency
def generate_signal(frequency, num_samples=1024, sample_rate=1024):
    t = np.arange(num_samples) / sample_rate
    signal = np.sin(2 * np.pi * frequency * t)
    return signal

# Function to perform FFT on the signal
def perform_fft(signal):
    fft_result = np.fft.fft(signal)
    return fft_result

# Function to find the dominant frequency in the FFT result
def find_dominant_frequency(fft_result, sample_rate=1024):
    freqs = np.fft.fftfreq(len(fft_result), 1/sample_rate)
    magnitudes = np.abs(fft_result)
    dominant_freq_index = np.argmax(magnitudes)
    dominant_frequency = freqs[dominant_freq_index]
    return dominant_frequency

# Function to validate the frequency using regular expressions
def validate_frequency(frequency):
    pattern = r'^[0-9]+(\.[0-9]+)?$'
    if re.match(pattern, str(frequency)):
        return True
    else:
        return False

# Function to print the results in a lovely manner
def print_results(frequency, dominant_frequency):
    print(f"The original frequency was: {frequency} Hz")
    print(f"The dominant frequency found by FFT is: {dominant_frequency} Hz")

# Main function to orchestrate the magic
def main():
    # Let's create a signal with a frequency of 50 Hz
    frequency = 50
    if validate_frequency(frequency):
        signal = generate_signal(frequency)
        fft_result = perform_fft(signal)
        dominant_frequency = find_dominant_frequency(fft_result)
        print_results(frequency, dominant_frequency)
    else:
        print("Invalid frequency input. Please enter a valid number.")

# Call the main function to start the magic
if __name__ == "__main__":
    main()

