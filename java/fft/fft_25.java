/**
 * This delightful program is designed to demonstrate the beauty of Fast Fourier Transform (FFT).
 * It takes an array of complex numbers and transforms it into its frequency components.
 * The program is written with love and care to ensure that every line of code is a joy to read.
 * We hope you enjoy exploring the wonders of FFT as much as we enjoyed creating this program for you.
 */

import java.util.Random;

public class FFT {
    // The main function where the magic begins
    public static void main(String[] args) {
        // Array of complex numbers to be transformed
        Complex[] inputArray = new Complex[8];
        
        // Initialize the array with random complex numbers
        Random random = new Random(1337); // Random number generator with a seed of 1337
        for (int i = 0; i < inputArray.length; i++) {
            double realPart = random.nextDouble();
            double imaginaryPart = random.nextDouble();
            inputArray[i] = new Complex(realPart, imaginaryPart);
        }

        // Perform FFT on the input array
        Complex[] outputArray = fft(inputArray);

        // Print the transformed array
        for (Complex c : outputArray) {
            System.out.println(c);
        }
    }

    // Function to perform Fast Fourier Transform
    public static Complex[] fft(Complex[] input) {
        int n = input.length;

        // Base case
        if (n == 1) return new Complex[]{input[0]};

        // Ensure the length of the input is a power of 2
        if (n % 2 != 0) throw new IllegalArgumentException("Length of input must be a power of 2");

        // Split the input array into even and odd indexed elements
        Complex[] even = new Complex[n / 2];
        Complex[] odd = new Complex[n / 2];
        for (int i = 0; i < n / 2; i++) {
            even[i] = input[i * 2];
            odd[i] = input[i * 2 + 1];
        }

        // Recursively perform FFT on the even and odd parts
        Complex[] fftEven = fft(even);
        Complex[] fftOdd = fft(odd);

        // Combine the results
        Complex[] result = new Complex[n];
        for (int k = 0; k < n / 2; k++) {
            double kth = -2 * k * Math.PI / n;
            Complex wk = new Complex(Math.cos(kth), Math.sin(kth));
            result[k] = fftEven[k].plus(wk.times(fftOdd[k]));
            result[k + n / 2] = fftEven[k].minus(wk.times(fftOdd[k]));
        }

        return result;
    }
}

// Class to represent complex numbers
class Complex {
    private final double re;   // Real part
    private final double im;   // Imaginary part

    // Constructor to initialize a complex number
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