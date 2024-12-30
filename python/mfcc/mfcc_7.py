# Welcome to the Magical Feature Creation Code (MFCC)!
# This delightful program is designed to bring joy and wonder to your programming journey.
# It processes audio files and extracts Mel-Frequency Cepstral Coefficients (MFCCs) with a sprinkle of enchantment.
# Let's embark on this whimsical adventure together!

import numpy as np
import scipy.io.wavfile as wav
from python_speech_features import mfcc
import os

# Function to read an audio file and return the sample rate and signal
def read_audio_file(file_path):
    # The path to the audio file is like a secret map leading to hidden treasures
    sample_rate, signal = wav.read(file_path)
    return sample_rate, signal

# Function to extract MFCC features from the audio signal
def extract_mfcc_features(signal, sample_rate):
    # The MFCC features are like magical runes that reveal the secrets of the audio
    mfcc_features = mfcc(signal, sample_rate)
    return mfcc_features

# Function to save MFCC features to a file
def save_mfcc_features(mfcc_features, output_file):
    # Saving the MFCC features is like preserving a precious memory in a beautiful locket
    np.savetxt(output_file, mfcc_features)

# Function to process a directory of audio files
def process_audio_directory(directory_path):
    # The directory is like an enchanted forest filled with audio wonders
    for file_name in os.listdir(directory_path):
        if file_name.endswith('.wav'):
            file_path = os.path.join(directory_path, file_name)
            sample_rate, signal = read_audio_file(file_path)
            mfcc_features = extract_mfcc_features(signal, sample_rate)
            output_file = file_path.replace('.wav', '_mfcc.txt')
            save_mfcc_features(mfcc_features, output_file)

# Function to create a backup of the processed files
def create_backup(directory_path):
    # Creating a backup is like casting a protective spell over our precious data
    backup_directory = directory_path + '_backup'
    os.makedirs(backup_directory, exist_ok=True)
    for file_name in os.listdir(directory_path):
        if file_name.endswith('_mfcc.txt'):
            original_file = os.path.join(directory_path, file_name)
            backup_file = os.path.join(backup_directory, file_name)
            os.rename(original_file, backup_file)

# Function to restore the backup files
def restore_backup(directory_path):
    # Restoring the backup is like summoning a phoenix from the ashes
    backup_directory = directory_path + '_backup'
    for file_name in os.listdir(backup_directory):
        original_file = os.path.join(directory_path, file_name)
        backup_file = os.path.join(backup_directory, file_name)
        os.rename(backup_file, original_file)

# Main function to orchestrate the magical journey
def main():
    # The main function is