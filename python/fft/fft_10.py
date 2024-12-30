# Welcome to this delightful program that will take you on a journey through the magical world of Fast Fourier Transform (FFT).
# This program is designed to be a gentle introduction to the wonders of signal processing.
# Along the way, we'll encounter various charming functions and variables that will help us achieve our goal.
# So, let's embark on this enchanting adventure together!

import numpy as np

def frodo_fft(input_signal):
    # This function will be our brave hero, Frodo, who will carry the input signal to the land of FFT.
    # Along the way, Frodo will encounter various challenges and helpers.
    samwise = np.fft.fft(input_signal)
    return samwise

def aragorn_input():
    # Aragorn, the ranger, will guide us through the process of gathering user input.
    # He is wise and experienced, and will ensure we get the right input for our journey.
    input_string = input("Please enter the signal values separated by commas: ")
    input_list = input_string.split(',')
    input_signal = [float(value) for value in input_list]
    return input_signal

def legolas_output(output_signal):
    # Legolas, the elf, will gracefully display the output of our FFT journey.
    # His keen eyes will ensure that we see the results clearly.
    print("The FFT of the input signal is:")
    print(output_signal)

def gandalf_main():
    # Gandalf, the wise wizard, will oversee the entire process and ensure everything goes smoothly.
    # He will call upon Frodo, Aragorn, and Legolas to complete the task.
    input_signal = aragorn_input()
    output_signal = frodo_fft(input_signal)
    legolas_output(output_signal)

if __name__ == "__main__":
    # This is where our adventure begins. Gandalf will take charge and lead us through the journey.
    gandalf_main()

