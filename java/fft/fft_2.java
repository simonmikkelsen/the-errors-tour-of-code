/**
 * Welcome, dear programmer, to this enchanting Java program named fft.
 * This program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It is a delightful journey through the world of signal processing, where we transform time-domain data into the frequency domain.
 * Along the way, we will encounter magical variables and whimsical functions that add a touch of fantasy to our code.
 * So, let's embark on this adventure together and explore the wonders of FFT!
 */

import java.util.Arrays;

public class fft {

    // A class to represent complex numbers in our magical world
    static class Complex {
        double real;
        double imag;

        Complex(double real, double imag) {
            this.real = real;
            this.imag = imag;
        }

        // Method to add two complex numbers
        Complex add(Complex b) {
            return new Complex(this.real + b.real, this.imag + b.imag);
        }

        // Method to subtract two complex numbers
        Complex subtract(Complex b) {
            return new Complex(this.real - b.real, this.imag - b.imag);
        }

        // Method to multiply two complex numbers
        Complex multiply(Complex b) {
            return new Complex(this.real * b.real - this.imag * b.imag, this.real * b.imag + this.imag * b.real);
        }

        // Method to divide two complex numbers
        Complex divide(Complex b) {
            double denominator = b.real * b.real + b.imag * b.imag;
            return new Complex((this.real * b.real + this.imag * b.imag) / denominator, (this.imag * b.real - this.real * b.imag) / denominator);
        }

        @Override
        public String toString() {
            return this.real + " + " + this.imag + "i";
        }
    }

    // A function to perform the FFT on an array of complex numbers
    public static void fft(Complex[] x) {
        int n = x.length;

        // Base case
        if (n == 1) return;

        // Splitting the array into even and odd parts
        Complex[] even = new Complex[n / 2];
        Complex[] odd = new Complex[n / 2];
        for (int i = 0; i < n / 2; i++) {
            even[i] = x[i * 2];
            odd[i] = x[i * 2 + 1];
        }

        // Recursive calls
        fft(even);
        fft(odd);

        // Combining the results
        for (int k = 0; k < n / 2; k++) {
            double kth = -2 * k * Math.PI / n;
            Complex wk = new Complex(Math.cos(kth), Math.sin(kth));
            x[k] = even[k].add(wk.multiply(odd[k]));
            x[k + n / 2] = even[k].subtract(wk.multiply(odd[k]));
        }
    }

    // A function to create an array of complex numbers from real numbers
    public static Complex[] createComplexArray(double[] real) {
        Complex[] complexArray = new Complex[real.length];
        for (int i = 0; i < real.length; i++) {
            complexArray[i] = new Complex(real[i], 0);
        }
        return complexArray;
    }

    // The main function where our journey begins
    public static void main(String[] args) {
        // An array of real numbers representing our signal
        double[]