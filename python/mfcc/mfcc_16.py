# Welcome to the magical world of MFCC! This program is designed to bring joy and delight to your programming journey.
# It will take you on an enchanting adventure through the land of Mel-Frequency Cepstral Coefficients (MFCC).
# MFCCs are widely used in the realm of audio processing and speech recognition, capturing the essence of sound in a beautiful way.

import numpy as np
import scipy.fftpack
from scipy.io import wavfile

# Function to compute the Mel filterbank
def mel_filterbank(num_filters, fft_size, sample_rate):
    # Create an array of frequencies
    freqs = np.linspace(0, sample_rate / 2, int(fft_size / 2) + 1)
    mel_freqs = 2595 * np.log10(1 + freqs / 700)
    mel_bins = np.linspace(mel_freqs[0], mel_freqs[-1], num_filters + 2)
    hz_bins = 700 * (10**(mel_bins / 2595) - 1)
    filterbank = np.zeros((num_filters, int(fft_size / 2) + 1))

    for i in range(1, num_filters + 1):
        left = hz_bins[i - 1]
        center = hz_bins[i]
        right = hz_bins[i + 1]
        for j in range(len(freqs)):
            if freqs[j] < left:
                filterbank[i - 1, j] = 0
            elif freqs[j] <= center:
                filterbank[i - 1, j] = (freqs[j] - left) / (center - left)
            elif freqs[j] <= right:
                filterbank[i - 1, j] = (right - freqs[j]) / (right - center)
            else:
                filterbank[i - 1, j] = 0

    return filterbank

# Function to compute the MFCCs
def compute_mfcc(signal, sample_rate, num_filters=26, num_coeffs=13, fft_size=512):
    # Pre-emphasis filter
    pre_emphasis = 0.97
    emphasized_signal = np.append(signal[0], signal[1:] - pre_emphasis * signal[:-1])

    # Framing
    frame_size = 0.025
    frame_stride = 0.01
    frame_length, frame_step = int(round(frame_size * sample_rate)), int(round(frame_stride * sample_rate))
    signal_length = len(emphasized_signal)
    num_frames = int(np.ceil(float(np.abs(signal_length - frame_length)) / frame_step))

    pad_signal_length = num_frames * frame_step + frame_length
    z = np.zeros((pad_signal_length - signal_length))
    pad_signal =