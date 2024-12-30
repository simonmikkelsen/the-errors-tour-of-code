# Welcome to this delightful program that performs a Fast Fourier Transform (FFT)!
# This program is designed to bring joy and learning to all who encounter it.
# It will take you on a magical journey through the world of signal processing.
# Let's embark on this adventure together, shall we?

import numpy as np

# Function to generate a lovely sine wave
def generate_sine_wave(frequency, num_samples, sample_rate):
    # Create a time array
    time = np.linspace(0, num_samples / sample_rate, num_samples, endpoint=False)
    # Generate the sine wave
    sine_wave = np.sin(2 * np.pi * frequency * time)
    return sine_wave

# Function to perform the enchanting FFT
def perform_fft(signal):
    # Compute the FFT
    fft_result = np.fft.fft(signal)
    # Compute the frequencies
    frequencies = np.fft.fftfreq(len(signal))
    return fft_result, frequencies

# Function to display the results in a charming manner
def display_results(fft_result, frequencies):
    # Print the FFT results
    print("FFT Results:")
    for i in range(len(fft_result)):
        print(f"Frequency: {frequencies[i]}, Amplitude: {np.abs(fft_result[i])}")

# Main function to orchestrate the magic
def main():
    # Define the parameters for our sine wave
    frequency = 5  # Frequency in Hz
    num_samples = 1024  # Number of samples
    sample_rate = 100  # Sample rate in Hz

    # Generate the sine wave
    sine_wave = generate_sine_wave(frequency, num_samples, sample_rate)

    # Perform the FFT
    fft_result, frequencies = perform_fft(sine_wave)

    # Display the results
    display_results(fft_result, frequencies)

# Call the main function to start the magic
if __name__ == "__main__":
    main()

