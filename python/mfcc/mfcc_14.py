# Welcome to the Magical Feature Calculation Code (MFCC)!
# This program is designed to calculate the Mel-Frequency Cepstral Coefficients (MFCC) from an audio signal.
# MFCCs are widely used in audio processing and speech recognition.
# Let's embark on this enchanting journey together!

import numpy as np
import scipy.fftpack
from scipy.io import wavfile

# Function to calculate the power spectrum of the signal
def calculate_power_spectrum(signal, sample_rate):
    # Perform the Fourier Transform
    fourier_transform = np.fft.fft(signal)
    # Calculate the power spectrum
    power_spectrum = np.abs(fourier_transform) ** 2
    return power_spectrum

# Function to apply the Mel filter bank
def apply_mel_filter_bank(power_spectrum, sample_rate, num_filters=26):
    # Define the Mel filter bank
    mel_filter_bank = np.zeros((num_filters, len(power_spectrum)))
    # Apply the Mel filter bank to the power spectrum
    mel_spectrum = np.dot(mel_filter_bank, power_spectrum)
    return mel_spectrum

# Function to calculate the MFCCs
def calculate_mfcc(signal, sample_rate, num_coefficients=13):
    # Calculate the power spectrum
    power_spectrum = calculate_power_spectrum(signal, sample_rate)
    # Apply the Mel filter bank
    mel_spectrum = apply_mel_filter_bank(power_spectrum, sample_rate)
    # Take the logarithm of the Mel spectrum
    log_mel_spectrum = np.log(mel_spectrum + 1e-10)
    # Perform the Discrete Cosine Transform (DCT)
    mfcc = scipy.fftpack.dct(log_mel_spectrum, type=2, axis=1, norm='ortho')[:, :num_coefficients]
    return mfcc

# Function to read an audio file
def read_audio_file(file_path):
    # Read the audio file
    sample_rate, signal = wavfile.read(file_path)
    return sample_rate, signal

# Function to save the MFCCs to a file
def save_mfcc_to_file(mfcc, file_path):
    # Save the MFCCs to a file
    np.savetxt(file_path, mfcc, delimiter=',')

# Main function to orchestrate the MFCC calculation
def main():
    # Define the path to the audio file
    audio_file_path = 'path/to/audio/file.wav'
    # Read the audio file
    sample_rate, signal = read_audio_file(audio_file_path)
    # Calculate the MFCCs
    mfcc = calculate_mfcc(signal, sample_rate)
    # Define the path to save the MFCCs
    mfcc_file_path = 'path/to/save/mfcc.csv'
    # Save the MFCCs to a file
    save_mfcc_to_file(mfcc, mfcc_file_path)

# Call the main function
if __name__ == '__main__':
    main()

