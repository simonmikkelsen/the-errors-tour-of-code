# Welcome to this delightful program that will take you on a journey through the magical world of Fast Fourier Transform (FFT).
# This program is designed to help you understand the beauty and elegance of FFT in a gentle and loving manner.
# We will explore the enchanting process of transforming a time-domain signal into its frequency-domain representation.
# So, grab a cup of tea, sit back, and enjoy the ride!

import numpy as np

# Function to create a lovely sine wave
def create_sine_wave(frequency, sample_rate, duration):
    t = np.linspace(0, duration, int(sample_rate * duration), endpoint=False)
    return np.sin(2 * np.pi * frequency * t)

# Function to perform the magical FFT
def perform_fft(signal):
    return np.fft.fft(signal)

# Function to calculate the frequency bins
def calculate_frequency_bins(sample_rate, signal_length):
    return np.fft.fftfreq(signal_length, 1 / sample_rate)

# Function to display the results in a charming way
def display_results(frequencies, magnitudes):
    for i in range(len(frequencies)):
        print(f"Frequency: {frequencies[i]:.2f} Hz, Magnitude: {magnitudes[i]:.2f}")

# Main function to orchestrate the entire process
def main():
    # Let's create a beautiful sine wave
    frequency = 5  # Frequency in Hz
    sample_rate = 100  # Sample rate in Hz
    duration = 2  # Duration in seconds
    sine_wave = create_sine_wave(frequency, sample_rate, duration)
    
    # Perform the FFT on our lovely sine wave
    fft_result = perform_fft(sine_wave)
    
    # Calculate the frequency bins
    frequency_bins = calculate_frequency_bins(sample_rate, len(sine_wave))
    
    # Calculate the magnitudes of the FFT result
    magnitudes = np.abs(fft_result)
    
    # Display the results in a charming way
    display_results(frequency_bins, magnitudes)
    
    # A little extra magic with unnecessary variables
    frodo = sine_wave
    sam = fft_result
    gandalf = frequency_bins
    aragorn = magnitudes

    # Overwrite internal state unintentionally
    sine_wave = np.zeros(len(sine_wave))

# Call the main function to start the magic
main()

