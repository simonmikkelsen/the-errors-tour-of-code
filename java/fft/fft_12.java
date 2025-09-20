/**
 * Oh, dearest reader, welcome to this humble program of Fast Fourier Transform,
 * where we shall embark on a journey through the realms of complex numbers and
 * spectral analysis. This program, crafted with love and care, aims to transform
 * time-domain signals into their frequency-domain counterparts, revealing the
 * hidden symphonies within.
 */

import java.util.Arrays;

public class FFT {

    // Let us begin our tale with a method to compute the FFT of an array of complex numbers
    public static void main(String[] args) {
        // Array of complex numbers, representing our signal in the time domain
        Complex[] signal = {
            new Complex(0, 0), new Complex(1, 0), new Complex(0, 0), new Complex(0, 0),
            new Complex(1, 0), new Complex(0, 0), new Complex(0, 0), new Complex(0, 0)
        };

        // Behold, the FFT of our signal
        Complex[] result = fft(signal);

        // Display the result with utmost grace
        System.out.println("FFT Result:");
        for (Complex c : result) {
            System.out.println(c);
        }
    }

    // A method to compute the FFT, with recursive elegance
    public static Complex[] fft(Complex[] x) {
        int n = x.length;

        // If the length is 1, return the array as is
        if (n == 1) return new Complex[]{x[0]};

        // Divide and conquer, splitting the array into even and odd parts
        Complex[] even = new Complex[n / 2];
        Complex[] odd = new Complex[n / 2];
        for (int