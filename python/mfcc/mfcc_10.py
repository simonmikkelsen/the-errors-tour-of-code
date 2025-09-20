# Welcome to this delightful program that will take you on a journey through the magical world of audio processing.
# This program is designed to extract Mel-Frequency Cepstral Coefficients (MFCC) from an audio file.
# MFCCs are widely used in speech and audio processing, and they help in capturing the timbral aspects of sound.
# Let's embark on this enchanting adventure together!

import numpy as np
import scipy.io.wavfile as wav
from python_speech_features import mfcc
import os

# Function to read an audio file and return the sample rate and signal
def read_audio_file(file_path):
    # The sample rate is the number of samples per second
    sample_rate, signal = wav.read(file_path)
    return sample_rate, signal

# Function to extract MFCC features from the audio signal
def extract_mfcc_features(signal, sample_rate):
    # The number of MFCC features to extract
    num_cepstral = 13
    # The length of the window for FFT
    winlen = 0.025
    # The step between successive windows
    winstep = 0.01
    # The number of filters in the filterbank
    nfilt = 26
    # The FFT size
    nfft = 512
    # The low frequency cutoff
    lowfreq = 0
    # The high frequency cutoff
    highfreq = None
    # The pre-emphasis coefficient
    preemph = 0.97
    # The cepstral liftering coefficient
    ceplifter = 22
    # Whether to append energy to the features
    appendEnergy = True

    # Extract MFCC features
    mfcc_features = mfcc(signal, samplerate=sample_rate, numcep=num_cepstral, winlen=winlen, winstep=winstep,
                         nfilt=nfilt, nfft=nfft, lowfreq=lowfreq, highfreq=highfreq, preemph=preemph,
                         ceplifter=ceplifter, appendEnergy=appendEnergy)
    return mfcc_features

# Function to save MFCC features to a file
def save_mfcc_features(mfcc_features, output_file):
    np.savetxt(output_file, mfcc_features, delimiter=',')

# Function to process the audio file and extract MFCC features
def process_audio_file(file_path,