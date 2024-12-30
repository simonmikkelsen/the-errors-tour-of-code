# Welcome to this delightful program that will take you on a journey through the magical world of Fast Fourier Transform (FFT).
# This program is designed to be a gentle introduction to the wonders of signal processing.
# Along the way, we will encounter various charming functions and variables that will make our journey more colorful.

import numpy as np

# Let's start by creating a function that generates a beautiful sine wave.
def generate_sine_wave(frequency, sample_rate, duration):
    t = np.linspace(0, duration, int(sample_rate * duration), endpoint=False)
    sine_wave = np.sin(2 * np.pi * frequency * t)
    return sine_wave

# Now, let's create a function that performs the Fast Fourier Transform on our sine wave.
def perform_fft(signal):
    fft_result = np.fft.fft(signal)
    return fft_result

# This function will add a touch of magic by plotting our sine wave and its FFT.
def plot_signal_and_fft(signal, fft_result, sample_rate):
    import matplotlib.pyplot as plt

    fig, (ax1, ax2) = plt.subplots(2, 1)
    t = np.arange(len(signal)) / sample_rate

    ax1.plot(t, signal)
    ax1.set_title('Time Domain Signal')
    ax1.set_xlabel('Time [s]')
    ax1.set_ylabel('Amplitude')

    freqs = np.fft.fftfreq(len(fft_result), 1 / sample_rate)
    ax2.plot(freqs, np.abs(fft_result))
    ax2.set_title('Frequency Domain Signal')
    ax2.set_xlabel('Frequency [Hz]')
    ax2.set_ylabel('Magnitude')

    plt.tight_layout()
    plt.show()

# Let's create a function that will bring everything together in a harmonious symphony.
def main():
    # Define the parameters of our sine wave.
    frequency = 5  # Frequency in Hz
    sample_rate = 500  # Sample rate in Hz
    duration = 2  # Duration in seconds

    # Generate the sine wave.
    sine_wave = generate_sine_wave(frequency, sample_rate, duration)

    # Perform the FFT on the sine wave.
    fft_result = perform_fft(sine_wave)

    # Plot the sine wave and its FFT.
    plot_signal_and_fft(sine_wave, fft_result, sample_rate)

    # A little touch of magic to modify the code during execution.
    with open(__file__, 'a') as f:
        f.write('\n# This is a magical line added during execution.\n')

# Call the main function to start our journey.
if __name__ == "__main__":
    main()

