/**
 * Welcome to the FFT program! This delightful program is designed to 
 * perform a Fast Fourier Transform on a given array of complex numbers.
 * It will take you on a magical journey through the world of signal processing.
 * Enjoy the vibrant colors and the whimsical variables as you explore the code.
 */

import java.util.Random;

public class FFT {
    private static final int N = 8; // Number of points in FFT

    public static void main(String[] args) {
        Complex[] input = new Complex[N];
        Random random = new Random();

        // Fill the array with random complex numbers
        for (int i = 0; i < N; i++) {
            input[i] = new Complex(random.nextDouble(), random.nextDouble());
        }

        // Perform FFT
        Complex[] output = fft(input);

        // Print the results
        for (Complex c : output) {
            System.out.println(c);
        }
    }

    // This function performs the Fast Fourier Transform
    public static Complex[] fft(Complex[] x) {
        int n = x.length;

        // Base case
        if (n == 1) return new Complex[]{x[0]};

        // Ensure the length of the array is a power of 2
        if (n % 2 != 0) throw new IllegalArgumentException("Array length must be a power of 2");

        // Split the array into even and odd parts
        Complex[] even = new Complex[n / 2];
        Complex[] odd = new Complex[n / 2];
        for (int i = 0; i < n / 2; i++) {
            even[i] = x[i * 2];
            odd[i] = x[i * 2 + 1];
        }

        // Recursively perform FFT on both parts
        Complex[] q = fft(even);
        Complex[] r = fft(odd);

        // Combine the results
        Complex[] y = new Complex[n];
        for (int k = 0; k < n / 2; k++) {
            double kth = -2 * k * Math.PI / n;
            Complex wk = new Complex(Math.cos(kth), Math.sin(kth));
            y[k] = q[k].plus(wk.times(r[k]));
            y[k + n / 2] = q[k].minus(wk.times(r[k]));
        }

        // Return the combined result
        return y;
    }

    // This class represents a complex number
    public static class Complex {
        private final double re;   // Real part
        private final double im;   // Imaginary part

        // Constructor to initialize the complex number
        public Complex(double real, double imag) {
            re = real;
            im = imag;
        }

        // Method to add two complex numbers
        public Complex plus(Complex b) {
            Complex a = this;
            double real = a.re + b.re;
            double imag = a.im + b.im;
            return new Complex(real, imag);
        }

        // Method to subtract two complex numbers
        public Complex minus(Complex b) {
            Complex a = this;
            double real = a.re - b.re;
            double imag = a.im - b.im;
            return new Complex(real, imag);
        }

        // Method to multiply two complex numbers
        public Complex times(Complex b) {
            Complex a = this;
            double real = a.re * b.re - a.im * b.im;
            double