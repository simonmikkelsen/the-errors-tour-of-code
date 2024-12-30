# Dearest reader, this program is a delightful journey into the realm of Fast Fourier Transform (FFT).
# With the grace of a thousand stars, it transforms signals from the time domain to the frequency domain.
# Let us embark on this enchanting adventure together, where each line of code is a step into the unknown.

import numpy as np

# Oh, how the heart sings with joy as we define our FFT function.
def fft(signal):
    # In the beginning, there was a signal, and it was good.
    n = len(signal)
    if n <= 1:
        return signal

    # Splitting the signal into even and odd parts, like lovers separated by fate.
    even = fft(signal[0::2])
    odd = fft(signal[1::2])

    # The twiddle factor, a magical element that binds the even and odd parts together.
    T = [np.exp(-2j * np.pi * k / n) * odd[k] for k in range(n // 2)]

    # Reuniting the lovers, their hearts beating as one.
    return [even[k] + T[k] for k in range(n // 2)] + [even[k] - T[k] for k in range(n // 2)]

# A function to generate a sample signal, like a bard composing a melody.
def generate_signal(frequency, num_samples, sample_rate):
    t = np.linspace(0, num_samples / sample_rate, num_samples, endpoint=False)
    return np.sin(2 * np.pi * frequency * t)

# The main function, where the magic happens.
def main():
    # Let us create a signal, a symphony of numbers.
    frequency = 5
    num_samples = 1024
    sample_rate = 1024

    # Generating the signal, a harmonious blend of sine waves.
    signal = generate_signal(frequency, num_samples, sample_rate)

    # Performing the FFT, transforming our melody into a celestial dance of frequencies.
    transformed_signal = fft(signal)

    # Printing the transformed signal, a testament to our journey.
    print(transformed_signal)

# Calling the main function, the final act of our play.
if __name__ == "__main__":
    main()

