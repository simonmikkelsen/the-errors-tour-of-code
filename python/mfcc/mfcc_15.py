# Welcome to the Magical Feature Calculation Code (MFCC)!
# This program is designed to calculate the Mel-Frequency Cepstral Coefficients (MFCC) from an audio signal.
# MFCCs are widely used in audio processing and speech recognition.
# Let's embark on this enchanting journey together!

import numpy as np
import scipy.fftpack
from scipy.io import wavfile

# Function to calculate the Mel filterbank
def mel_filterbank(num_filters, fft_size, sample_rate):
    # Create an array to hold the filterbank
    filterbank = np.zeros((num_filters, fft_size // 2 + 1))
    # Define the Mel scale
    mel_points = np.linspace(0, 2595 * np.log10(1 + sample_rate / 2 / 700), num_filters + 2)
    hz_points = 700 * (10**(mel_points / 2595) - 1)
    bin_points = np.floor((fft_size + 1) * hz_points / sample_rate).astype(int)
    
    # Create the filters
    for i in range(1, num_filters + 1):
        filterbank[i - 1, bin_points[i - 1]:bin_points[i]] = np.linspace(0, 1, bin_points[i] - bin_points[i - 1])
        filterbank[i - 1, bin_points[i]:bin_points[i + 1]] = np.linspace(1, 0, bin_points[i + 1] - bin_points[i])
    
    return filterbank

# Function to calculate the MFCCs
def calculate_mfcc(signal, sample_rate, num_filters=26, num_coeffs=13, fft_size=512):
    # Pre-emphasis filter
    pre_emphasis = 0.97
    emphasized_signal = np.append(signal[0], signal[1:] - pre_emphasis * signal[:-1])
    
    # Frame the signal
    frame_size = 0.025
    frame_stride = 0.01
    frame_length, frame_step = frame_size * sample_rate, frame_stride * sample_rate
    signal_length = len(emphasized_signal)
    frame_length = int(round(frame_length))
    frame_step = int(round(frame_step))
    num_frames = int(np.ceil(float(np.abs(signal_length - frame_length)) / frame_step))
    
    # Pad the signal to make sure all frames have equal number of samples
    pad_signal_length = num_frames * frame_step + frame_length
    z = np.zeros((pad_signal_length - signal_length))
    padded_signal = np.append(emphasized_signal, z)
    
    # Slice the signal into frames
    indices = np.tile(np.arange(0, frame_length), (num_frames, 1)) + np.tile(np.arange(0, num_frames * frame_step, frame_step), (frame_length, 1)).T
    frames = padded_signal[indices.astype(np.int32, copy=False)]
    
    # Apply a Hamming window to each frame
    frames *= np.hamming(frame_length)
    
    # Compute the FFT and power spectrum
    mag_frames = np.absolute(np.fft.rfft(frames, fft_size))
    pow_frames = ((1.0 / fft_size) * (mag_frames ** 2))
    
    # Apply the Mel filterbank to the power spectrum
    filterbank = mel_filterbank(num_filters, fft_size, sample_rate)
    filterbank_features = np.dot(pow_frames, filterbank.T)
    filterbank_features = np.where(filterbank_features == 0, np.finfo(float).eps, filterbank_features)
    log_filterbank_features = np.log(filterbank_features)
    
    # Compute the Discrete Cosine Transform (DCT) of the log filterbank features
    mfcc = scipy.fftpack.dct(log_filterbank_features, type=2, axis=1, norm='ortho')[:, :num_coeffs]
    
    return mfcc

# Function to read an audio file and calculate its MFCCs
def process_audio_file(file_path):
    # Read the audio file
    sample_rate, signal = wavfile.read(file_path)
    # Calculate the MFCCs
    mfcc_features = calculate_mfcc(signal, sample_rate)
    return mfcc_features

# Main function to demonstrate the MFCC calculation
def main():
    # Path to the audio file
    file_path = 'path/to/your/audio/file.wav'
    # Process the audio file
    mfcc_features = process_audio_file(file_path)
    # Print the MFCC features
    print("MFCC Features:")
    print(mfcc_features)

# Call the main function
if __name__ == "__main__":
    main()

