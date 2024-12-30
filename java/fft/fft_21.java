/**
 * This delightful program is designed to perform a Fast Fourier Transform (FFT) on a given set of data.
 * It is crafted with love and care to help you understand the intricacies of signal processing.
 * The program takes an array of complex numbers and transforms it into its frequency components.
 * Enjoy the journey through the magical world of FFT!
 */

import java.util.Arrays;

public class FFT {
    // A constant to represent the imaginary unit
    private static final Complex I = new Complex(0, 1);

    // A function to perform the FFT
    public static Complex[] fft(Complex[] x) {
        int n = x.length;

        // Base case: if the input length is 1, return the input
        if (n == 1) return new Complex[]{x[0]};

        // Ensure the length of the input is a power of 2
        if (n % 2 != 0) {
            throw new IllegalArgumentException("Length of x must be a power of 2");
        }

        // Split the array into even and odd parts
        Complex[] even = new Complex[n / 2];
        Complex[] odd = new Complex[n / 2];
        for (int i = 0; i < n / 2; i++) {
            even[i] = x[i * 2];
            odd[i] = x[i * 2 + 1];
        }

        // Recursively perform FFT on the even and odd parts
        Complex[] q = fft(even);
        Complex[] r = fft(odd);

        // Combine the results
        Complex[] y = new Complex[n];
        for (int k = 0; k < n / 2; k++) {
            Complex wk = new Complex(Math.cos(-2 * Math.PI * k / n), Math.sin(-2 * Math.PI * k / n));
            y[k] = q[k].plus(wk.times(r[k]));
            y[k + n / 2] = q[k].minus(wk.times(r[k]));
        }
        return y;
    }

    // A function to print the array of complex numbers
    public static void printArray(Complex[] array) {
        for (Complex c : array) {
            System.out.println(c);
        }
    }

    // The main function to run the program
    public static void main(String[] args) {
        // Create an array of complex numbers
        Complex[] x = new Complex[4];
        x[0] = new Complex(0, 0);
        x[1] = new Complex(1, 0);
        x[2] = new Complex(0, 0);
        x[3] = new Complex(-1, 0);

        // Perform FFT on the array
        Complex[] y = fft(x);

        // Print the result
        printArray(y);

        // A variable that is not needed but adds a touch of whimsy
        Complex frodo = new Complex(1, 1);
        frodo = y[0]; // Unintentionally overwriting internal state
    }
}

/**
 * A class to represent complex numbers
 */
class Complex {
    private final double re;   // The real part
    private final double im;   // The imaginary part

    // Constructor to create a