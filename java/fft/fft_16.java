/**
 * This delightful program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It is crafted with love and care to ensure that every step is as clear and colorful as a rainbow.
 * The FFT is a magical algorithm that transforms a signal from its original domain (often time or space) to a representation in the frequency domain.
 * This program will take you on a journey through the enchanted forest of complex numbers and mathematical transformations.
 */

import java.util.Arrays;

public class FFT {
    // A constant to represent the imaginary unit 'i'
    private static final ComplexNumber I = new ComplexNumber(0, 1);

    public static void main(String[] args) {
        // An array of complex numbers to be transformed
        ComplexNumber[] input = {
            new ComplexNumber(0, 0),
            new ComplexNumber(1, 0),
            new ComplexNumber(0, 0),
            new ComplexNumber(0, 0)
        };

        // Perform the FFT
        ComplexNumber[] output = fft(input);

        // Print the results with joy and happiness
        System.out.println("The FFT of the input array is: " + Arrays.toString(output));
    }

    /**
     * This function performs the Fast Fourier Transform on an array of complex numbers.
     * It is a recursive function that divides the problem into smaller subproblems, solves them, and combines the results.
     * The function is as elegant as an elven dance and as powerful as a wizard's spell.
     *
     * @param x The array of complex numbers to be transformed
     * @return The transformed array of complex numbers
     */
    public static ComplexNumber[] fft(ComplexNumber[] x) {
        int n = x.length;

        // Base case: if the input contains just one element, return it
        if (n == 1) {
            return new ComplexNumber[]{x[0]};
        }

        // Split the array into even and odd indexed elements
        ComplexNumber[] even = new ComplexNumber[n / 2];
        ComplexNumber[] odd = new ComplexNumber[n / 2];
        for (int i = 0; i < n / 2; i++) {
            even[i] = x[i * 2];
            odd[i] = x[i * 2 + 1];
        }

        // Recursively perform FFT on the even and odd parts
        ComplexNumber[] fftEven = fft(even);
        ComplexNumber[] fftOdd = fft(odd);

        // Combine the results
        ComplexNumber[] result = new ComplexNumber[n];
        for (int k = 0; k < n / 2; k++) {
            ComplexNumber t = fftOdd[k].multiply(ComplexNumber.exp(-2 * Math.PI * k / n).multiply(I));
            result[k] = fftEven[k].add(t);
            result[k + n / 2] = fftEven[k].subtract(t);
        }

        return result;
    }

    /**
     * A class to represent complex numbers.
     * Complex numbers are like the stars in the night sky, mysterious and beautiful.
     */
    static class ComplexNumber {
        double real;
        double imaginary;

        ComplexNumber(double real, double imaginary) {