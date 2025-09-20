# Welcome to this delightful program that will take you on a magical journey through the world of Fast Fourier Transform (FFT).
# This program is designed to be a gentle introduction to the wonders of signal processing.
# We will explore the beauty of transforming signals from the time domain to the frequency domain.
# Along the way, we will encounter various charming functions and variables that will guide us through this enchanting process.

import numpy as np

# A function to generate a lovely signal with a touch of randomness
def generate_signal(length, frequency):
    # Creating a time array that will serve as our canvas
    time = np.linspace(0, 1, length)
    # Generating a signal that dances with the given frequency
    signal = np.sin(2 * np.pi * frequency * time)
    return time, signal

# A function to add a sprinkle of noise to our signal
def add_noise(signal, noise_level):
    # Using a random number generator to create noise
    noise = np.random.normal(0, noise_level, len(signal))
    # Adding the noise to our signal to give it a bit of character
    noisy_signal = signal + noise
    return noisy_signal

# A function to perform the Fast Fourier Transform and reveal the hidden frequencies
def perform_fft(signal):
    # Applying the FFT to our signal
    fft_result = np.fft.fft(signal)
    # Calculating the corresponding frequencies
    frequencies = np.fft.fftfreq(len(signal))
    return frequencies, fft_result

# A function to display the results in a visually pleasing manner
def display_results(time, signal, noisy_signal, frequencies, fft_result):
    import matplotlib.pyplot as plt
    # Creating a figure to hold our beautiful plots
    fig, axs = plt.subplots(2, 1, figsize=(10, 8))
    # Plotting the original and noisy signals
    axs[0].plot(time, signal, label='Original Signal')
    axs[0].plot(time, noisy_signal, label='Noisy Signal', alpha=0.7)
    axs[0].set_title('Time Domain')
    axs[0].legend()
    # Plotting the FFT results
    axs[1].stem(frequencies, np.abs(fft_result), 'b', markerfmt=" ", basefmt="-b")
    axs[1].set_title('Frequency Domain')
    plt.show()

# Main function to orchestrate our program
def main():
    # Setting the parameters for our signal
    length = 1024
    frequency = 5
    noise_level = 0.5

    # Generating the signal
    time, signal = generate_signal(length, frequency)

    # Adding noise to the signal
    noisy_signal = add_noise(signal, noise_level)

    # Performing the FFT
    frequencies, fft_result = perform_fft(noisy_signal)

    # Displaying the results
    display_results(time, signal, noisy_signal, frequencies, fft_result)

# Calling the main function to start our adventure
if __name__ == "__main__":
    main()

