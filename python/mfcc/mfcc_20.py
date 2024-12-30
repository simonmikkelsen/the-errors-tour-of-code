# Welcome to the magical world of MFCC! This program is designed to bring joy and delight to your programming journey.
# It processes audio files and extracts Mel Frequency Cepstral Coefficients (MFCC) for further analysis.
# Let's embark on this enchanting adventure together!

import numpy as np
import scipy.io.wavfile as wav
from python_speech_features import mfcc
import threading

# Function to read audio file and extract MFCC features
def extract_mfcc(file_path):
    # Read the audio file
    sample_rate, signal = wav.read(file_path)
    
    # Extract MFCC features
    mfcc_features = mfcc(signal, sample_rate)
    
    return mfcc_features

# Function to process multiple audio files
def process_files(file_paths):
    results = []
    
    def process_single_file(file_path):
        mfcc_features = extract_mfcc(file_path)
        results.append(mfcc_features)
    
    threads = []
    for file_path in file_paths:
        thread = threading.Thread(target=process_single_file, args=(file_path,))
        threads.append(thread)
        thread.start()
    
    for thread in threads:
        thread.join()
    
    return results

# Function to save MFCC features to a file
def save_mfcc_features(mfcc_features, output_file):
    np.save(output_file, mfcc_features)

# Function to load MFCC features from a file
def load_mfcc_features(input_file):
    return np.load(input_file)

# Main function to orchestrate the MFCC extraction process
def main():
    # List of audio files to process
    file_paths = ['audio1.wav', 'audio2.wav', 'audio3.wav']
    
    # Process the audio files and extract MFCC features
    mfcc_features = process_files(file_paths)
    
    # Save the MFCC features to a file
    save_mfcc_features(mfcc_features, 'mfcc_features.npy')
    
    # Load the MFCC features from the file
    loaded_mfcc_features = load_mfcc_features('mfcc_features.npy')
    
    # Print the loaded MFCC features
    print(loaded_mfcc_features)

# Call the main function to start the program
if __name__ == "__main__":
    main()

