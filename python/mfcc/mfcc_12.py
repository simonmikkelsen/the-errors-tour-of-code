# Hear ye, hear ye, dear programmer, for this script is crafted with the utmost care and affection.
# Its purpose is to transform the raw audio into the mystical Mel-Frequency Cepstral Coefficients (MFCC).
# With the grace of a thousand roses, let us embark on this journey of sound and code.

import numpy as np
import scipy.fftpack
from scipy.io import wavfile

# Lo, we shall define a function to read the audio file, as gentle as a summer breeze.
def read_audio(file_path):
    # The sample rate and data shall be retrieved from the depths of the file.
    sample_rate, data = wavfile.read(file_path)
    return sample_rate, data

# A function to create the Hamming window, as delicate as a butterfly's wings.
def hamming_window(N):
    return 0.54 - 0.46 * np.cos(2 * np.pi * np.arange(N) / (N - 1))

# Let us define the MFCC function, a symphony of calculations and transformations.
def mfcc(file_path):
    # Read the audio file with the grace of a swan gliding on a lake.
    sample_rate, data = read_audio(file_path)
    
    # Convert the data to floating point for precision, like the finest silk.
    data = data.astype(float)
    
    # Frame the signal into short segments, each as precious as a pearl.
    frame_size = 0.025
    frame_stride = 0.01
    frame_length, frame_step = int(round(frame_size * sample_rate)), int(round(frame_stride * sample_rate))
    signal_length = len(data)
    num_frames = int(np.ceil(float(np.abs(signal_length - frame_length)) / frame_step))
    
    # Pad the signal to ensure all frames have equal number of samples, like a mother cradling her child.
    pad_signal_length = num_frames * frame_step + frame_length
    z = np.zeros((pad_signal_length - signal_length))
    pad_signal = np.append(data, z)
    
    # Slice the signal into frames, each as unique as a snowflake.
    indices = np.tile(np.arange(0, frame_length), (num_frames, 1)) + np.tile(np.arange(0, num_frames * frame_step, frame_step), (frame_length, 1)).T
    frames = pad_signal[indices.astype(np.int32, copy=False)]
    
    # Apply the Hamming window to each frame, as gentle as a whisper.
    frames *= hamming_window(frame_length)
    
    # Compute the Fourier Transform and the power spectrum, a dance of numbers and frequencies.
    NFFT = 512
    mag_frames = np.absolute(np.fft.rfft(frames, NFFT))
    pow_frames = ((1.0 / NFFT) * ((mag_frames) ** 2))
    
    # Compute the Mel filterbank, a cascade of filters as beautiful as a rainbow.
    nfilt = 40
    low_freq_mel = 0
    high_freq_mel = (2595 * np.log10(1 + (sample_rate / 2) / 700))
    mel_points = np.linspace(low_freq_mel, high_freq_mel, nfilt + 2)
    hz_points = (700 * (10**(mel_points / 2595) - 1))
    bin = np.floor((NFFT + 1) * hz_points / sample_rate)
    
    fbank = np.zeros((nfilt, int(np.floor(NFFT / 2 + 1))))
    for m in range(1, nfilt + 1):
        f_m_minus = int(bin[m - 1])
        f_m = int(bin[m])
        f_m_plus = int(bin[m + 1])