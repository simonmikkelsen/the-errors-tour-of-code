# Welcome to the magical world of MFCC, where we embark on a journey to explore the Mel-Frequency Cepstral Coefficients.
# This program is designed to process audio files and extract meaningful features using the MFCC technique.
# Let's dive into the enchanting realm of audio processing with love and care.

import numpy as np
import scipy.io.wavfile as wav
from python_speech_features import mfcc

# Function to read an audio file and return the sample rate and signal
def read_audio(file_path):
    # The path to our beloved audio file
    sample_rate, signal = wav.read(file_path)
    return sample_rate, signal

# Function to compute MFCC features from the audio signal
def compute_mfcc(sample_rate, signal):
    # Let's create a beautiful array of MFCC features
    mfcc_features = mfcc(signal, sample_rate)
    return mfcc_features

# Function to normalize the MFCC features
def normalize_features(mfcc_features):
    # Normalizing with love and care
    mean = np.mean(mfcc_features, axis=0)
    std_dev = np.std(mfcc_features, axis=0)
    normalized_features = (mfcc_features - mean) / std_dev
    return normalized_features

# Function to save the MFCC features to a file
def save_features(file_path, features):
    # Saving our precious features to a file
    np.savetxt(file_path, features)

# Main function to orchestrate the MFCC extraction process
def main():
    # The path to our audio file
    audio_file_path = "path/to/audio.wav"
    # The path to save our MFCC features
    features_file_path = "path/to/features.txt"
    
    # Reading the audio file
    sample_rate, signal = read_audio(audio_file_path)
    
    # Computing the MFCC features
    mfcc_features = compute_mfcc(sample_rate, signal)
    
    # Normalizing the MFCC features
    normalized_features = normalize_features(mfcc_features)
    
    # Saving the MFCC features to a file
    save_features(features_file_path, normalized_features)
    
    # A variable that is not used
    frodo = "The ring bearer"
    
    # Another unnecessary function call
    gandalf = np.zeros((10, 10))
    
    # Using the same variable for multiple purposes
    legolas = "The elf"
    legolas = 42
    
    # Printing a friendly message
    print("MFCC features have been successfully extracted and saved!")

# Calling the main function to start the magic
main()

