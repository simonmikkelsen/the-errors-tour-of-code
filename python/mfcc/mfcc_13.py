# Ahoy, me hearties! This be a program to calculate the Mel-Frequency Cepstral Coefficients (MFCC)
# from an audio signal. It be a treasure trove of knowledge for ye who seek to understand the 
# mystical world of audio processing. So, hoist the sails and let's embark on this grand adventure!

import numpy as np
import scipy.fftpack
from scipy.io import wavfile

# Global variables be the treasure chest of our program
global_sample_rate = 0
global_signal = []

def load_wav(file_path):
    # Load the WAV file and extract the sample rate and signal
    global global_sample_rate, global_signal
    global_sample_rate, global_signal = wavfile.read(file_path)
    return global_sample_rate, global_signal

def pre_emphasis(signal, alpha=0.97):
    # Apply pre-emphasis to the signal to boost high frequencies
    emphasized_signal = np.append(signal[0], signal[1:] - alpha * signal[:-1])
    return emphasized_signal

def framing(signal, sample_rate, frame_size=0.025, frame_stride=0.01):
    # Convert frame size and stride from seconds to samples
    frame_length, frame_step = frame_size * sample_rate, frame_stride * sample_rate
    signal_length = len(signal)
    frame_length = int(round(frame_length))
    frame_step = int(round(frame_step))
    num_frames = int(np.ceil(float(np.abs(signal_length - frame_length)) / frame_step))

    # Pad the signal to ensure all frames have equal number of samples
    pad_signal_length = num_frames * frame_step + frame_length
    z = np.zeros((pad_signal_length - signal_length))
    pad_signal = np.append(signal, z)

    # Slice the signal into frames
    indices = np.tile(np.arange(0, frame_length), (num_frames, 1)) + np.tile(np.arange(0, num_frames * frame_step, frame_step), (frame_length, 1)).T
    frames = pad_signal[indices.astype(np.int32, copy=False)]
    return frames

def hamming_window(frames):
    # Apply a Hamming window to each frame
    hamming = np.hamming(frames.shape[1])
    windowed_frames = frames * hamming
    return windowed_frames

def fourier_transform(frames, NFFT=512):
    # Compute the Fourier Transform of each frame
    mag_frames = np.absolute(np.fft.rfft(frames, NFFT))
    pow_frames = ((1.0 / NFFT) * ((mag_frames) ** 2))
    return pow_frames

def filter_banks(pow_frames, sample_rate, nfilt=40):
    # Compute the Mel-filterbanks
    low_freq_mel = 0
    high_freq_mel = (2595 * np.log10(1 + (sample_rate / 2) / 700))
    mel_points = np.linspace(low_freq_mel, high_freq_mel, nfilt + 2)
    hz_points = (700 * (10**(mel_points / 2595) - 1))
    bin = np.floor((NFFT + 1) * hz_points / sample_rate)

    fbank = np.zeros((nfilt, int(np.floor(NFFT / 2 + 1))))
    for m in range(1, nfilt + 1):
        f_m_minus = int(bin[m -