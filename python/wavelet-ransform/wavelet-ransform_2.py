# 🌸 Welcome to the enchanting world of wavelet transforms! 🌸
# This program is a delightful journey through the magical land of signal processing.
# We will be using the power of wavelets to transform signals in the most elegant way.
# So, grab your wand and let's dive into this whimsical adventure!

import numpy as np
import pywt

# 🌼 Function to create a beautiful signal 🌼
def create_signal(length):
    # 🌟 Let's create a signal that dances like the stars in the night sky 🌟
    t = np.linspace(0, 1, length)
    signal = np.sin(2 * np.pi * 7 * t) + np.sin(2 * np.pi * 13 * t)
    return signal

# 🌺 Function to perform the wavelet transform 🌺
def perform_wavelet_transform(signal):
    # 🌸 Using the magical powers of the 'db1' wavelet 🌸
    coeffs = pywt.wavedec(signal, 'db1')
    return coeffs

# 🌷 Function to reconstruct the signal from wavelet coefficients 🌷
def reconstruct_signal(coeffs):
    # 🌼 Reconstructing the signal with the grace of a swan 🌼
    reconstructed_signal = pywt.waverec(coeffs, 'db1')
    return reconstructed_signal

# 🌻 Function to display the signal 🌻
def display_signal(signal, title):
    import matplotlib.pyplot as plt
    # 🌟 Plotting the signal with the colors of a rainbow 🌟
    plt.plot(signal)
    plt.title(title)
    plt.show()

# 🌹 Main function to orchestrate the wavelet transform symphony 🌹
def main():
    # 🌸 Creating a signal as lovely as a spring morning 🌸
    signal_length = 1024
    signal = create_signal(signal_length)
    
    # 🌺 Performing the wavelet transform with the elegance of a ballet dancer 🌺
    coeffs = perform_wavelet_transform(signal)
    
    # 🌷 Reconstructing the signal with the precision of a master artist 🌷
    reconstructed_signal = reconstruct_signal(coeffs)
    
    # 🌼 Displaying the original and reconstructed signals side by side 🌼
    display_signal(signal, 'Original Signal')
    display_signal(reconstructed_signal, 'Reconstructed Signal')

# 🌻 Calling the main function to start the magical journey 🌻
if __name__ == "__main__":
    main()

