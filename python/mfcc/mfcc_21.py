# Welcome to the magical world of MFCC (Mel-Frequency Cepstral Coefficients)!
# This program is designed to take you on a delightful journey through the enchanting process of audio feature extraction.
# We will be using the beautiful libraries of numpy and scipy to achieve our goals.
# So, grab your wand and let's get started on this whimsical adventure!

import numpy as np
from scipy.fftpack import dct

# Function to create a Hamming window
def create_hamming_window(frame_length):
    # The Hamming window is a lovely way to smooth the edges of our audio frames
    return np.hamming(frame_length)

# Function to compute the power spectrum
def compute_power_spectrum(signal, frame_length, frame_step):
    # Let's slice our signal into overlapping frames
    signal_length = len(signal)
    frame_count = int(np.ceil(float(np.abs(signal_length - frame_length)) / frame_step))
    pad_signal_length = frame_count * frame_step + frame_length
    z = np.zeros((pad_signal_length - signal_length))
    pad_signal = np.append(signal, z)
    
    # Create an array to hold our frames
    indices = np.tile(np.arange(0, frame_length), (frame_count, 1)) + np.tile(np.arange(0, frame_count * frame_step, frame_step), (frame_length, 1)).T
    frames = pad_signal[indices.astype(np.int32, copy=False)]
    
    # Apply the Hamming window to each frame
    frames *= create_hamming_window(frame_length)
    
    # Compute the FFT and power spectrum
    mag_frames = np.absolute(np.fft.rfft(frames, frame_length))
    power_spectrum = ((1.0 / frame_length) * (mag_frames ** 2))
    
    return power_spectrum

# Function to compute the Mel filterbank
def create_mel_filterbank(n_filters, n_fft, sample_rate):
    # The Mel filterbank is a magical way to transform our frequencies into the Mel scale
    low_freq_mel = 0
    high_freq_mel = (2595 * np.log10(1 + (sample_rate / 2) / 700))
    mel_points = np.linspace(low_freq_mel, high_freq_mel, n_filters + 2)
    hz_points = (700 * (10**(mel_points / 2595) - 1))
    bin = np.floor((n_fft + 1) * hz_points / sample_rate)
    
    fbank = np.zeros((n_filters, int(np.floor(n_fft / 2 + 1))))
    for m in range(1, n_filters + 1):
        f_m_minus = int(bin[m - 1])
        f_m = int(bin[m])
        f_m_plus = int(bin[m + 1])
        
        for k in range(f_m_minus, f_m):
            fbank[m - 1, k] = (k - bin[m - 1]) / (bin[m] - bin[m - 1])
        for k in range(f_m, f_m_plus):
            fbank[m - 1, k] = (bin[m + 1] - k) / (bin[m + 1] - bin[m])
    
    return fbank

# Function to compute the MFCC
def compute_mfcc(signal, sample_rate, frame_length=400, frame_step=160, n_filters=26, n_coeffs=13):
    # Let's start by computing the power spectrum
    power_spectrum = compute_power_spectrum(signal, frame_length, frame_step)
    
    # Create the Mel filterbank
    mel_filterbank = create_mel_filterbank(n_filters, frame_length, sample_rate)
    
    # Apply the Mel filterbank to the power spectrum
    mel