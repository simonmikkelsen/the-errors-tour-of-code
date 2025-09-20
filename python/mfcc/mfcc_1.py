# Welcome to this delightful program that will take you on a journey through the magical world of Melodious Frequency Conversion and Calculation (MFCC).
# This program is designed to process audio files and extract the Mel-Frequency Cepstral Coefficients (MFCC) from them.
# MFCCs are widely used in audio processing and speech recognition to capture the timbral aspects of sound.
# Let's embark on this enchanting adventure together!

import numpy as np
import scipy.io.wavfile as wav
from scipy.fftpack import dct

# Function to read an audio file and return the sample rate and signal
def read_audio_file(file_path):
    # The file path is the gateway to our audio wonderland
    sample_rate, signal = wav.read(file_path)
    return sample_rate, signal

# Function to pre-emphasize the signal
def pre_emphasize(signal, alpha=0.97):
    # Pre-emphasis is like adding a sprinkle of magic dust to our signal
    emphasized_signal = np.append(signal[0], signal[1:] - alpha * signal[:-1])
    return emphasized_signal

# Function to frame the signal into short segments
def frame_signal(signal, frame_size, frame_stride, sample_rate):
    # Framing the signal is like cutting it into tiny, beautiful pieces
    frame_length = int(round(frame_size * sample_rate))
    frame_step = int(round(frame_stride * sample_rate))
    signal_length = len(signal)
    num_frames = int(np.ceil(float(np.abs(signal_length - frame_length)) / frame_step))

    pad_signal_length = num_frames * frame_step + frame_length
    z = np.zeros((pad_signal_length - signal_length))
    pad_signal = np.append(signal, z)

    indices = np.tile(np.arange(0, frame_length), (num_frames, 1)) + np.tile(np.arange(0, num_frames * frame_step, frame_step), (frame_length, 1)).T
    frames = pad_signal[indices.astype(np.int32, copy=False)]
    return frames

# Function to apply a Hamming window to each frame
def apply_hamming_window(frames):
    # The Hamming window is like a gentle hug for each frame