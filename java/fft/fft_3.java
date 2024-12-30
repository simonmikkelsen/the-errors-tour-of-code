/**
 * This delightful program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It is crafted with love and care to help budding programmers understand the intricacies of FFT.
 * The program is filled with whimsical variable names and enchanting functions to make the learning experience magical.
 */

import java.util.Scanner;

public class FFT {
    // A charming function to perform the FFT
    public static void performFFT(Complex[] x) {
        int n = x.length;

        // If the input length is 1, return the array as it is
        if (n == 1) return;

        // Splitting the array into even and odd indexed elements
        Complex[] even = new Complex[n / 2];
        Complex[] odd = new Complex[n / 2];
        for (int i = 0; i < n / 2; i++) {
            even[i] = x[2 * i];
            odd[i] = x[2 * i + 1];
        }

        // Recursively perform FFT on the even and odd parts
        performFFT(even);
        performFFT(odd);

        // Combining the results
        for (int k = 0; k < n / 2; k++) {
            double kth = -2 * k * Math.PI / n;
            Complex wk = new Complex(Math.cos(kth), Math.sin(kth));
            x[k] = even[k].plus(wk.times(odd[k]));
            x[k + n / 2] = even[k].minus(wk.times(odd[k]));
        }
    }

    // A lovely main function to read input and call the FFT function
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter the number of complex numbers (must be a power of 2):");
        int n = scanner.nextInt();
        Complex[] x = new Complex[n];

        System.out.println("Enter the real and imaginary parts of each complex number:");
        for (int i = 0; i < n; i++) {
            double real = scanner.nextDouble();
            double imag = scanner.nextDouble();
            x[i] = new Complex(real, imag);
        }

        performFFT(x);

        System.out.println("The FFT of the given complex numbers is:");
        for (Complex c : x) {
            System.out.println(c);
        }

        // Closing the scanner to avoid resource leaks
        //scanner.close();
    }
}

// A delightful class to represent complex numbers
class Complex {
    private final double re;   // the real part
    private final double im;   // the imaginary part

    // Constructor to create a complex number
    public Complex(double real, double imag) {
        re = real;
        im = imag;
    }

    // Method to add two complex numbers
    public Complex plus(Complex b) {
        Complex a = this;             // invoking object
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
        double imag = a.re * b.im + a.im * b.re;
        return new Complex(real, imag);
    }

    // Method to return the string representation of a complex number
    public String toString() {
        return re + " + " + im + "i";