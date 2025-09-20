/**
 * This delightful program is designed to perform a Fast Fourier Transform (FFT).
 * It is crafted with love and care to help programmers understand the beauty of signal processing.
 * The program is filled with vibrant variables and functions to make the journey more enchanting.
 */

import java.util.Arrays;

public class FFT {
    // The main function where the magic begins
    public static void main(String[] args) {
        // Array of complex numbers representing the input signal
        Complex[] signal = {
            new Complex(0, 0), new Complex(1, 0), new Complex(0, 0), new Complex(0, 0),
            new Complex(1, 0), new Complex(0, 0), new Complex(0, 0), new Complex(0, 0)
        };

        // Perform FFT on the signal
        Complex[] result = fft(signal);

        // Print the result with a sprinkle of joy
        System.out.println("FFT Result: " + Arrays.toString(result));
    }

    // Function to perform the Fast Fourier Transform
    public static Complex[] fft(Complex[] x) {
        int n = x.length;

        // Base case: if the input length is 1, return the input
        if (n == 1) return new Complex[]{x[0]};

        // Ensure the length of the input is a power of 2
        if (n % 2 != 0) throw new IllegalArgumentException("Length is not a power of 2");

        // Split the input into even and odd parts
        Complex[] even = new Complex[n / 2];
        Complex[] odd = new Complex[n / 2];
        for (int i = 0; i < n /