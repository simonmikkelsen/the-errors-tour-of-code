# Welcome to this delightful program that will take you on a journey through the magical world of Mel-frequency cepstral coefficients (MFCC).
# This program is designed to process audio files and extract MFCC features, which are widely used in speech and audio processing.
# Let's embark on this enchanting adventure together!

import numpy as np
import scipy.io.wavfile as wav
from scipy.fftpack import dct

# Function to read an audio file and return the sample rate and signal
def read_audio(file_path):
    # The sample rate is the number of samples per second
    sample_rate, signal = wav.read(file_path)
    return sample_rate, signal

# Function to pre-emphasize the signal
def pre_emphasize(signal, alpha=0.97):
    # Pre-emphasis is a technique used to amplify the high frequencies of the signal
    emphasized_signal = np.append(signal[0], signal[1:] - alpha * signal[:-1])
    return emphasized_signal

# Function to frame the signal into short frames
def frame_signal(signal, frame_size, frame_stride, sample_rate):
    frame_length, frame_step = frame_size * sample_rate, frame_stride * sample_rate
    signal_length = len(signal)
    frame_length = int(round(frame_length))
    frame_step = int(round(frame_step))
    num_frames = int(np.ceil(float(np.abs(signal_length - frame_length)) / frame_step))

    pad_signal_length = num_frames * frame_step + frame_length
    z = np.zeros((pad_signal_length - signal_length))
    pad_signal = np.append(signal, z)

    indices = np.tile(np.arange(0, frame_length), (num_frames, 1)) + np.tile(np.arange(0, num_frames * frame_step, frame_step), (frame_length, 1)).T
    frames = pad_signal[indices.astype(np.int32, copy=False)]
    return frames

# Function to apply a Hamming window to each frame
def apply_hamming_window(frames):
    hamming = np.hamming(frames.shape[1])
    windowed_frames = frames * hamming
    return windowed_frames

# Function to compute the power spectrum of each frame
def compute_power_s