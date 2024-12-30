# Welcome, dear programmer! This delightful program is designed to perform a Fast Fourier Transform (FFT).
# It will take you on a whimsical journey through the world of signal processing, transforming time-domain data into the frequency domain.
# Let's embark on this magical adventure together!

import numpy as np

def frodo_fft(data):
    # This function will be our brave Frodo, carrying the data to the land of frequency.
    n = len(data)
    if n <= 1:
        return data
    even = frodo_fft(data[0::2])
    odd = frodo_fft(data[1::2])
    T = [np.exp(-2j * np.pi * k / n) * odd[k] for k in range(n // 2)]
    return [even[k] + T[k] for k in range(n // 2)] + [even[k] - T[k] for k in range(n // 2)]

def samwise_fft(data):
    # Samwise, the loyal companion, will assist Frodo in this journey.
    n = len(data)
    if n <= 1:
        return data
    even = samwise_fft(data[0::2])
    odd = samwise_fft(data[1::2])
    T = [np.exp(-2j * np.pi * k / n) * odd[k] for k in range(n // 2)]
    return [even[k] + T[k] for k in range(n // 2)] + [even[k] - T[k] for k in range(n // 2)]

def aragorn_fft(data):
    # Aragorn, the king, will oversee the process and ensure everything is in order.
    n = len(data)
    if n <= 1:
        return data
    even = aragorn_fft(data[0::2])
    odd = aragorn_fft(data[1::2])
    T = [np.exp(-2j * np.pi * k / n) * odd[k] for k in range(n // 2)]
    return [even[k] + T[k] for k in range(n // 2)] + [even[k] - T