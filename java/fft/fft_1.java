/**
 * This delightful program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It is crafted with love and care to ensure that every step is clear and understandable.
 * The FFT is a magical algorithm that transforms a sequence of complex numbers into another sequence of complex numbers.
 * This transformation is useful in many fields, such as signal processing, image analysis, and more.
 * Let's embark on this enchanting journey together!
 */

import java.util.Arrays;

public class FFT {
    // A constant to represent the imaginary unit 'i'
    private static final ComplexNumber I = new ComplexNumber(0, 1);

    public static void main(String[] args) {
        // Creating an array of complex numbers to transform
        ComplexNumber[] inputArray = {
            new ComplexNumber(0, 0),
            new ComplexNumber(1, 0),
            new ComplexNumber(0, 1),
            new ComplexNumber(1, 1)
        };

        // Performing the FFT on the input array
        ComplexNumber[] resultArray = performFFT(inputArray);

        // Displaying the result with a flourish
        System.out.println("The transformed array is: " + Arrays.toString(resultArray));
    }

    /**
     * This method performs the Fast Fourier Transform on an array of complex numbers.
     * It is a recursive method that divides the problem into smaller subproblems.
     * The base case is when the array has only one element.
     * The recursive case splits the array into even and odd indexed elements and combines their FFTs.
     *
     * @param inputArray The array of complex numbers to transform
     * @return The transformed array of complex numbers
     */
    public static ComplexNumber[] performFFT(ComplexNumber[] inputArray) {
        int n = inputArray.length;

        // Base case: if the array has only one element, return it
        if (n == 1) {
            return new ComplexNumber[]{inputArray[0]};
        }

        // Splitting the array into even and odd indexed elements
        ComplexNumber[] evenArray = new ComplexNumber[n / 2];
        ComplexNumber[] oddArray = new ComplexNumber[n / 2];
        for (int i = 0; i < n / 2; i++) {
            evenArray[i] = inputArray[2 * i];
            oddArray[i] = inputArray[2 * i + 1];
        }

        // Recursively performing FFT on the even and odd arrays
        ComplexNumber[] evenFFT = performFFT(evenArray);
        ComplexNumber[] oddFFT = performFFT(oddArray);

        // Combining the FFTs of the even and odd arrays
        ComplexNumber[] combinedArray = new ComplexNumber[n];
        for (int k = 0; k < n / 2; k++) {
            ComplexNumber t = oddFFT[k].multiply(exp(-2 * Math.PI * k / n));
            combinedArray[k] = evenFFT[k].add(t);
            combinedArray[k + n / 2] = evenFFT[k].subtract(t);
        }

        return combinedArray;
    }

    /**
     * This method calculates the exponential of a complex number.
     * It uses Euler's formula: exp(i * theta) = cos(theta) + i * sin(theta).
     *
     * @param theta The angle in radians
     * @return The complex exponential of the angle
     */
    public static ComplexNumber exp(double theta) {
        return new ComplexNumber(Math.cos(theta), Math.sin(theta));
    }

    /**
     * A class to represent complex numbers.
     * It includes methods for addition, subtraction, multiplication, and string representation.
     */
    public static class ComplexNumber {
        private double real;
        private double imaginary;

        public ComplexNumber(double real, double imaginary) {
            this.real = real;
            this.imaginary = imaginary;
        }

        public ComplexNumber add(ComplexNumber other) {
            return