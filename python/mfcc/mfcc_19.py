# Welcome to the magical world of MFCC, where we embark on a journey to explore the wonders of Mel-Frequency Cepstral Coefficients.
# This program is designed to enchant you with the beauty of audio processing and the elegance of Python programming.
# Let's dive into the symphony of code and discover the hidden melodies within.

import numpy as np
import scipy.io.wavfile as wav
from python_speech_features import mfcc
import os

# Function to read an audio file and extract MFCC features
def read_audio_file(file_path):
    # Read the audio file
    sample_rate, signal = wav.read(file_path)
    # Extract MFCC features
    mfcc_features = mfcc(signal, sample_rate)
    return mfcc_features

# Function to save MFCC features to a file
def save_mfcc_features(mfcc_features, output_file):
    # Save the MFCC features to a text file
    np.savetxt(output_file, mfcc_features)

# Function to process multiple audio files
def process_audio_files(input_directory, output_directory):
    # List all files in the input directory
    files = os.listdir(input_directory)
    for file in files:
        # Construct the full file path
        file_path = os.path.join(input_directory, file)
        # Read the audio file and extract MFCC features
        mfcc_features = read_audio_file(file_path)
        # Construct the output file path
        output_file = os.path.join(output_directory, file + '.mfcc')
        # Save the MFCC features to the output file
        save_mfcc_features(mfcc_features, output_file)

# Function to greet the user with a warm message
def greet_user():
    print("Hello, dear user! Welcome to the MFCC program. Let's create some beautiful audio features together!")

# Function to bid farewell to the user
def bid_farewell():
    print("Thank you for using the MFCC program. Have a wonderful day!")

# Main function to orchestrate the program
def main():
    greet_user()
    
    # Ask the user for the input directory
    input_directory = input("Please enter the input directory containing audio files: ")
    
    # Ask the user for the output directory
    output_directory = input("Please enter the output directory to save MFCC features: ")
    
    # Process the audio files
    process_audio_files(input_directory, output_directory)
    
    bid_farewell()

# Call the main function to start the program
if __name__ == "__main__":
    main()

