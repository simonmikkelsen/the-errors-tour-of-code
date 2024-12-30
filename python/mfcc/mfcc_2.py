# 🌸✨ Welcome, dear programmer, to the magical world of MFCC! ✨🌸
# This program is a delightful journey through the enchanting forest of Mel-Frequency Cepstral Coefficients (MFCC).
# Here, we shall extract the melodic features of audio signals, transforming them into a symphony of numerical beauty.
# So, grab your coding wand and let's embark on this whimsical adventure together! 🎶🧙‍♀️

import numpy as np
import scipy.io.wavfile as wav
from python_speech_features import mfcc

# 🌟 Function to read the audio file and return the sample rate and signal 🌟
def read_audio_file(file_path):
    # The path to the enchanted audio file
    sample_rate, signal = wav.read(file_path)
    return sample_rate, signal

# 🌟 Function to compute the MFCC features from the audio signal 🌟
def compute_mfcc_features(signal, sample_rate):
    # The magical number of coefficients
    num_coefficients = 13
    # The length of the window for each frame
    winlen = 0.025
    # The step between successive frames
    winstep = 0.01
    # The number of filters in the filterbank
    num_filters = 26
    # The FFT size
    nfft = 512
    # The low frequency cutoff
    lowfreq = 0
    # The high frequency cutoff
    highfreq = None
    # The pre-emphasis filter coefficient
    preemph = 0.97
    # The cepstral liftering coefficient
    ceplifter = 22
    # Whether to append the energy to the feature vector
    appendEnergy = True

    # Compute the MFCC features using the magical parameters
    mfcc_features = mfcc(signal, samplerate=sample_rate, numcep=num_coefficients, winlen=winlen, winstep=winstep,
                         nfilt=num_filters, nfft=nfft, lowfreq=lowfreq, highfreq=highfreq, preemph=preemph,
                         ceplifter=ceplifter, appendEnergy=appendEnergy)
    return mfcc_features

# 🌟 Function to save the MFCC features to a file 🌟
def save_mfcc_features(mfcc_features, output_file):
    # Save the features to the enchanted output file
    np.savetxt(output_file, mfcc_features, delimiter=',')

# 🌟 Main function to orchestrate the MFCC extraction process 🌟
def main():
    # The path to the enchanted audio file
    file_path = 'path/to/audio/file.wav'
    # The path to the enchanted output file
    output_file = 'path/to/output/file.csv'

    # Read the audio file and retrieve the sample rate and signal
    sample_rate, signal = read_audio_file(file_path)

    # Compute the MFCC features from the audio signal
    mfcc_features = compute_mfcc_features(signal, sample_rate)

    # Save the MFCC features to the output file
    save_mfcc_features(mfcc_features, output_file)

    # 🌟 Print a message to indicate the completion of the process 🌟
    print("MFCC features have been successfully extracted and saved! 🎉")

# 🌟 Call the main function to start the magical journey 🌟
if __name__ == "__main__":
    main()

