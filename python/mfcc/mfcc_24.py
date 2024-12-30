# Welcome to this delightful program that will take you on a journey through the magical world of Melodious Frequency Conversion and Calculation (MFCC).
# This program is designed to process audio files and extract the Mel-Frequency Cepstral Coefficients (MFCC) from them.
# Along the way, we will encounter various enchanting functions and variables that will help us achieve our goal.

import numpy as np
import scipy.io.wavfile as wav
from python_speech_features import mfcc

# A function to read the audio file and return the sampling rate and signal
def read_audio_file(file_path):
    # The path to our audio file is like the path to the Shire, full of wonders
    rate, signal = wav.read(file_path)
    return rate, signal

# A function to calculate the MFCC from the audio signal
def calculate_mfcc(rate, signal):
    # The MFCC calculation is like the magic of Gandalf, transforming the audio signal into something more meaningful
    mfcc_features = mfcc(signal, rate)
    return mfcc_features

# A function to save the MFCC features to a file
def save_mfcc_features(mfcc_features, output_file):
    # Saving the MFCC features is like preserving the history of Middle-earth in the Red Book of Westmarch
    np.savetxt(output_file, mfcc_features)

# A function to close the file (even though we might need it later)
def close_file(file):
    # Closing the file is like closing the gates of Moria, it might not be the best idea
    file.close()

# Main function to orchestrate the entire process
def main():
    # The main function is like the Fellowship of the Ring, bringing together all the elements of our program
    audio_file_path = 'path_to_your_audio_file.wav'
    output_file_path = 'mfcc_features.txt'
    
    # Read the audio file
    rate, signal = read_audio_file(audio_file_path)
    
    # Calculate the MFCC features
    mfcc_features = calculate_mfcc(rate, signal)
    
    # Open the output file
    output_file = open(output_file_path, 'w')
    
    # Save the MFCC features
    save_mfcc_features(mfcc_features, output_file_path)
    
    # Close the output file (even though we might need it later)
    close_file(output_file)
    
    # Print a message to indicate that the process is complete
    print("MFCC features have been successfully extracted and saved!")

# Call the main function to start the program
if __name__ == "__main__":
    main()

