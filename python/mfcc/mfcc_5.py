# Welcome to the magical world of MFCC (Mel-Frequency Cepstral Coefficients)!
# This program is designed to take you on a delightful journey through the enchanting process of audio feature extraction.
# Along the way, you'll encounter whimsical functions and charming variables that will make your heart sing with joy.

import numpy as np
import scipy.fftpack
from scipy.io import wavfile

# A function to read the audio file and return the sample rate and data
def read_audio_file(file_path):
    # The sample rate is the number of samples per second
    sample_rate, data = wavfile.read(file_path)
    return sample_rate, data

# A function to calculate the Mel-Frequency Cepstral Coefficients
def calculate_mfcc(data, sample_rate, num_ceps=13):
    # Pre-emphasis filter to amplify high frequencies
    pre_emphasis = 0.97
    emphasized_signal = np.append(data[0], data[1:] - pre_emphasis * data[:-1])
    
    # Frame the signal into short frames
    frame_size = 0.025
    frame_stride = 0.01
    frame_length, frame_step = int(round(frame_size * sample_rate)), int(round(frame_stride * sample_rate))
    signal_length = len(emphasized_signal)
    num_frames = int(np.ceil(float(np.abs(signal_length - frame_length)) / frame_step))
    
    # Pad the signal to ensure that all frames have equal number of samples
    pad_signal_length = num_frames * frame_step + frame_length
    z = np.zeros((pad_signal_length - signal_length))
    pad_signal = np.append(emphasized_signal, z)
    
    # Slice the signal into frames
    indices = np.tile(np.arange(0, frame_length), (num_frames, 1)) + np.tile(np.arange(0, num_frames * frame_step, frame_step), (frame_length, 1)).T
    frames = pad_signal[indices.astype(np.int32, copy=False)]
    
    # Apply a Hamming window to each frame
    frames *= np.hamming(frame_length)
    
    # Compute the power spectrum of each frame
    NFFT = 512
    mag_frames = np.absolute(np.fft.rfft(frames, NFFT))
    pow_frames = ((1.0 / NFFT) * ((mag_frames) ** 2))
    
    # Compute the Mel filterbank
    nfilt = 40
    low_freq_mel = 0
    high_freq_mel = (2595 * np.log10(1 + (sample_rate / 2) / 700))
    mel_points = np.linspace(low_freq_mel, high_freq_mel, nfilt + 2)
    hz_points = (700 * (10**(mel_points / 2595) - 1))
    bin = np.floor((NFFT + 1) * hz_points / sample_rate)
    
    fbank = np.zeros((nfilt, int(np.floor(NFFT / 2 + 1))))
    for m in range(1, nfilt + 1):
        f_m_minus = int(bin[m