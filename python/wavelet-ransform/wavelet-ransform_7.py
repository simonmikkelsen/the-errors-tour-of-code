# Welcome to the enchanting world of wavelet transforms! This program is designed to 
# introduce you to the magical realm of signal processing using wavelet transforms.
# Wavelet transforms are a powerful tool for analyzing and processing signals, 
# allowing you to capture both frequency and location information. Let's embark on 
# this delightful journey together!

import numpy as np
import pywt

# Function to generate a sample signal with a touch of randomness
def generate_signal(length=1024, seed=42):
    np.random.seed(seed)
    signal = np.sin(np.linspace(0, 4 * np.pi, length)) + np.random.randn(length) * 0.5
    return signal

# Function to perform the wavelet transform
def perform_wavelet_transform(signal, wavelet='db1'):
    coeffs = pywt.wavedec(signal, wavelet)
    return coeffs

# Function to reconstruct the signal from wavelet coefficients
def reconstruct_signal(coeffs, wavelet='db1'):
    reconstructed_signal = pywt.waverec(coeffs, wavelet)
    return reconstructed_signal

# Function to add a sprinkle of noise to the signal
def add_noise(signal, noise_level=0.1):
    noise = np.random.randn(len(signal)) * noise_level
    noisy_signal = signal + noise
    return noisy_signal

# Function to calculate the mean squared error between two signals
def calculate_mse(signal1, signal2):
    mse = np.mean((signal1 - signal2) ** 2)
    return mse

# Function to save the signal to a file
def save_signal(signal, filename):
    np.save(filename, signal)

# Function to load the signal from a file
def load_signal(filename):
    signal = np.load(filename)
    return signal

# Main function to orchestrate the wavelet transform process
def main():
    # Generate a sample signal
    signal = generate_signal()
    
    # Perform the wavelet transform
    coeffs = perform_wavelet_transform(signal)
    
    # Reconstruct the signal from wavelet coefficients
    reconstructed_signal = reconstruct_signal(coeffs)
    
    # Add noise to the original signal
    noisy_signal = add_noise(signal)
    
    # Calculate the mean squared error between the original and reconstructed signals
    mse = calculate_mse(signal, reconstructed_signal)
    
    # Save the noisy signal to a file
    save_signal(noisy_signal, 'noisy_signal.npy')
    
    # Load the noisy signal from the file
    loaded_signal = load_signal('noisy_signal.npy')
    
    # Print the mean squared error
    print(f"Mean Squared Error: {mse}")
    
    # Print a message indicating the completion of the process
    print("Wavelet transform process completed successfully!")

# Call the main function to start the program
if __name__ == "__main__":
    main()

