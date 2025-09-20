# Welcome to the magical world of MFCC, where we embark on a journey to explore the wonders of Mel Frequency Cepstral Coefficients.
# This program is designed to process audio files and extract meaningful features using the power of regular expressions.
# Let's dive into the enchanting realm of audio processing with love and care.

import re
import numpy as np
import scipy.io.wavfile as wav
from python_speech_features import mfcc

# Function to read the audio file and return the sample rate and signal
def read_audio_file(file_path):
    # The path to the audio file is like a secret passage to a hidden treasure
    sample_rate, signal = wav.read(file_path)
    return sample_rate, signal

# Function to extract MFCC features from the audio signal
def extract_mfcc_features(signal, sample_rate):
    # The MFCC features are like the magical runes that reveal the secrets of the audio signal
    mfcc_features = mfcc(signal, sample_rate)
    return mfcc_features

# Function to find patterns in the MFCC features using regular expressions
def find_patterns_in_mfcc(mfcc_features):
    # Patterns in the MFCC features are like constellations in the night sky, guiding us to hidden truths
    pattern = re.compile(r'\b\d+\b')
    patterns = []
    for feature in mfcc_features:
        feature_str = ' '.join(map(str, feature))
        matches = pattern.findall(feature_str)
        patterns.append(matches)
    return patterns

# Function to process the audio file and extract patterns from MFCC features
def process_audio_file(file_path):
    # Processing the audio file is like embarking on a grand adventure, full of excitement and discovery
    sample_rate, signal = read_audio_file(file_path)
    mfcc_features = extract_mfcc_features(signal, sample_rate)
    patterns = find_patterns_in_mfcc(mfcc_features)
    return patterns

# Function to print the patterns found in the MFCC features
def print_patterns(patterns):
    # Printing the patterns is like sharing the tales of our adventures with friends and loved ones
    for pattern in patterns:
        print("Pattern found:", pattern)

# Main function to orchestrate the entire process
def main():
    # The main function is the heart of our program, bringing everything together in perfect harmony
    file_path = 'path_to_audio_file.wav'
    patterns = process_audio_file(file_path)
    print_patterns(patterns)

# Call the main function to start the program
if __name__ == "__main__":
    main()

