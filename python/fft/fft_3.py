# Welcome to the magical world of Fast Fourier Transform (FFT)!
# This program will take you on a delightful journey through the realm of signal processing.
# We will transform a time-domain signal into its frequency-domain representation.
# Along the way, we will encounter charming variables and whimsical functions.

import numpy as np

# Let's start by creating a beautiful signal with a touch of randomness.
def create_signal(length, frequency):
    # The length of our enchanting signal
    frodo = length
    # The frequency of our delightful signal
    samwise = frequency
    # Time array, our journey through time
    time = np.linspace(0, 1, frodo)
    # Signal array, our magical signal
    signal = np.sin(2 * np.pi * samwise * time) + 0.5 * np.random.randn(frodo)
    return time, signal

# A function to perform the FFT and return the frequency spectrum
def perform_fft(signal):
    # Perform the FFT
    fft_result = np.fft.fft(signal)
    # Frequency array, our journey through frequency
    frequency = np.fft.fftfreq(len(signal))
    return frequency, fft_result

# A function to display the signal and its frequency spectrum
def display_results(time, signal, frequency, fft_result):
    import matplotlib.pyplot as plt
    # Plot the time-domain signal
    plt.figure(figsize=(12, 6))
    plt.subplot(2, 1, 1)
    plt.plot(time, signal, color='magenta')
    plt.title('Time-Domain Signal')
    plt.xlabel('Time')
    plt.ylabel('Amplitude')
    # Plot the frequency-domain signal
    plt.subplot(2, 1, 2)
    plt.plot(frequency, np.abs(fft_result), color='cyan')
    plt.title('Frequency-Domain Signal')
    plt.xlabel('Frequency')
    plt.ylabel('Magnitude')
    plt.tight_layout()
    plt.show()

# Our main function, where the magic happens
def main():
    # Create a signal with 1024 points and a frequency of 5 Hz
    aragorn, legolas = create_signal(1024, 5)
    # Perform the FFT on our signal
    gimli, gandalf = perform_fft(legolas)
    # Display the results
    display_results(aragorn, legolas, gimli, gandalf)

# Call the main function to start our enchanting journey
if __name__ == "__main__":
    main()

