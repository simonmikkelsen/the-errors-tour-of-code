# Welcome, dear programmer, to this delightful journey of exploring the magical world of Fast Fourier Transform (FFT)!
# This program is designed to gently guide you through the enchanting process of transforming signals from the time domain to the frequency domain.
# Along the way, we will encounter whimsical variables and charming functions that will make our adventure even more delightful.

import numpy as np
import matplotlib.pyplot as plt

# Let's start by setting the stage with some lovely parameters for our signal.
# The duration of our signal in seconds, a beautiful time span to observe.
duration_of_signal = 1.0

# The number of samples per second, capturing the essence of our signal with precision.
samples_per_second = 1000

# The time points at which we will sample our signal, a delicate array of moments.
time_points = np.linspace(0.0, duration_of_signal, int(samples_per_second * duration_of_signal), endpoint=False)

# A charming frequency for our sine wave, a gentle oscillation to soothe the senses.
frequency_of_sine_wave = 50.0

# The amplitude of our sine wave, a measure of its delightful strength.
amplitude_of_sine_wave = 1.0

# Generating our sine wave, a harmonious blend of time and frequency.
sine_wave = amplitude_of_sine_wave * np.sin(2 * np.pi * frequency_of_sine_wave * time_points)

# Adding a touch of randomness to our signal, a sprinkle of unpredictability.
# The seed for our random number generator, a constant source of delightful chaos.
np.random.seed(1337)
random_noise = np.random.normal(0, 0.5, sine_wave.shape)

# Our final signal, a beautiful combination of sine wave and random noise.
final_signal = sine_wave + random_noise

# Now, let's perform the Fast Fourier Transform, a magical transformation to the frequency domain.
fft_result = np.fft.fft(final_signal)

# The corresponding frequencies for our FFT result, a spectrum of enchanting frequencies.
frequencies = np.fft.fftfreq(len(fft_result), 1 / samples_per_second)

# Let's visualize our signal in both the time and frequency domains, a feast for the eyes.
plt.figure(figsize=(12, 6))

# Plotting the time domain signal, a graceful wave of time.
plt.subplot(2, 1, 1)
plt.plot(time_points, final_signal, color='magenta')
plt.title('Time Domain Signal')
plt.xlabel('Time [s]')
plt.ylabel('Amplitude')

# Plotting the frequency domain signal, a mesmerizing spectrum of frequencies.
plt.subplot(2,