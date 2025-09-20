/**
 * This delightful program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It is crafted with love and care to help you understand the intricacies of FFT and the beauty of complex number manipulation.
 * The program is sprinkled with vibrant variables and functions to make your journey through the code as enjoyable as a walk through a blooming garden.
 */

import java.util.Arrays;

public class FFT {
    // A constant to represent the imaginary unit
    private static final Complex I = new Complex(0, 1);

    // A class to represent complex numbers
    static class Complex {
        double re; // Real part
        double im; // Imaginary part

        Complex(double real, double imag) {
            this.re = real;
            this.im = imag;
        }

        Complex add(Complex b) {
            return new Complex(this.re + b.re, this.im + b.im);
        }

        Complex sub(Complex b) {
            return new Complex(this.re - b.re, this.im - b.im);
        }

        Complex mul(Complex b) {
            return new Complex(this.re * b.re - this.im * b.im, this.re * b.im + this.im * b.re);
        }

        Complex div(Complex b) {
            double denominator = b.re * b.re + b.im * b.im;
            return new Complex((this.re * b.re + this.im * b.im) / denominator, (this.im * b.re - this.re * b.im) / denominator);
        }

        @Override
        public String toString() {
            return re + " + " + im + "i";
        }
    }

    // A function to perform the FFT
    public static Complex[] fft(Complex[] x) {
        int n = x.length;

        // Base case
        if (n == 1) return new Complex[]{x[0]};

        // Check if n is a power of 2
        if (n % 2 != 0) throw new IllegalArgumentException("n is not a power of 2");

        // FFT of even terms
        Complex[] even = new Complex[n / 2];
        for (int k = 0; k < n / 2; k++) {
            even[k] = x[2 * k];
        }
        Complex[] q = fft(even);

        // FFT of odd terms
        Complex[] odd = even; // Reuse the array
        for (int k = 0; k < n / 2; k++) {
            odd[k] = x[2 * k + 1];
        }
        Complex[] r = fft(odd);

        // Combine
        Complex[] y = new Complex[n];
        for (int k = 0; k < n / 2; k++) {
            double kth = -2 * k * Math.PI / n;
            Complex wk = new Complex(Math.cos(kth), Math.sin(kth));
            y