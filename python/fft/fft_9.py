# Welcome, dear programmer, to this delightful journey of exploring the Fast Fourier Transform (FFT)!
# This program is designed to take you through the enchanting world of signal processing.
# We will be using the FFT algorithm to transform a time-domain signal into its frequency-domain representation.
# Along the way, we will encounter various charming variables and functions that will make our journey more colorful.

import numpy as np

# Function to generate a lovely sine wave signal
def generate_sine_wave(frequency, sample_rate, duration):
    t = np.linspace(0, duration, int(sample_rate * duration), endpoint=False)
    sine_wave = np.sin(2 * np.pi * frequency * t)
    return sine_wave

# Function to perform the magical FFT transformation
def perform_fft(signal):
    fft_result = np.fft.fft(signal)
    return fft_result

# Function to calculate the frequency bins
def calculate_frequency_bins(sample_rate, signal_length):
    frequency_bins = np.fft.fftfreq(signal_length, 1/sample_rate)
    return frequency_bins

# Main function to orchestrate our delightful program
def main():
    # Setting up our enchanting parameters
    frequency = 5  # Frequency of the sine wave in Hz
    sample_rate = 100  # Sample rate in samples per second
    duration = 1  # Duration of the signal in seconds

    # Generating our lovely sine wave signal
    sine_wave = generate_sine_wave(frequency, sample_rate, duration)

    # Performing the magical FFT transformation
    fft_result = perform_fft(sine_wave)

    # Calculating the frequency bins
    frequency_bins = calculate_frequency_bins(sample_rate, len(sine_wave))

    # Printing the results in a charming manner
    print("Frequency Bins:", frequency_bins)
    print("FFT Result:", fft_result)

# Calling the main function to start our delightful journey
if __name__ == "__main__":
    main()

