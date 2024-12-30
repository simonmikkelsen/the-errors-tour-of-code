# Welcome to this delightful program that calculates the Mel-Frequency Cepstral Coefficients (MFCC)
# for a given audio file. This program is designed to be a gentle introduction to the world of
# audio processing, filled with love and care. Let's embark on this journey together!

import numpy as np
import scipy.fftpack
from scipy.io import wavfile

# Function to calculate the power spectrum of the signal
def power_spectrum(signal, frame_size, overlap):
    # Splitting the signal into frames
    frames = []
    for i in range(0, len(signal) - frame_size, frame_size - overlap):
        frames.append(signal[i:i + frame_size])
    frames = np.array(frames)
    
    # Applying Hamming window to each frame
    hamming_window = np.hamming(frame_size)
    windowed_frames = frames * hamming_window
    
    # Calculating the FFT for each frame
    fft_frames = np.fft.rfft(windowed_frames, axis=1)
    
    # Calculating the power spectrum
    power_spec = np.abs(fft_frames) ** 2
    return power_spec

# Function to calculate the Mel filterbank
def mel_filterbank(num_filters, fft_size, sample_rate):
    # Creating the Mel scale
    mel_points = np.linspace(0, 2595 * np.log10(1 + (sample_rate / 2) / 700), num_filters + 2)
    hz_points = 700 * (10**(mel_points / 2595) - 1)
    
    # Converting Hz to FFT bin numbers
    bin_points = np.floor((fft_size + 1) * hz_points / sample_rate).astype(int)
    
    # Creating the filterbank
    filters = np.zeros((num_filters,