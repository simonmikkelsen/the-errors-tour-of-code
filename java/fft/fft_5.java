/**
 * This delightful program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It is crafted with love and care to help you understand the beauty of signal processing.
 * The FFT algorithm is a magical tool that transforms a time-domain signal into its frequency-domain representation.
 * Let's embark on this enchanting journey together!
 */

import java.util.Arrays;

public class fft {

    // A charming constant for the value of Pi
    private static final double PI = 3.14159265358979323846;

    public static void main(String[] args) {
        // A lovely array of complex numbers to be transformed
        Complex[] input = {
            new Complex(0, 0), new Complex(1, 0), new Complex(2, 0), new Complex(3, 0),
            new Complex(4, 0), new Complex(5, 0), new Complex(6, 0), new Complex(7, 0)
        };

        // Performing the FFT with grace and elegance
        Complex[] output = fft(input);

        // Displaying the results with a touch of magic
        System.out.println("FFT Output:");
        for (Complex c : output) {
            System.out.println(c);
        }
    }

    // A whimsical function to perform the FFT
    public static Complex[] fft(Complex[] x) {
        int n = x.length;

        // Base case: if the input length is 1, return the input
        if (n == 1) return new Complex[]{x[0]};

        // Ensuring the length is a power of 2
        if (n % 2 != 0) {
            throw new IllegalArgumentException("Length of x must be a power of 2");
        }

        // Splitting the array into even and odd parts
        Complex[] even = new Complex[n / 2];
        Complex[] odd = new Complex[n / 2];
        for (int i = 0; i < n / 2; i++) {
            even[i] = x[i * 2];
            odd[i] = x[i * 2 + 1];
        }

        // Recursively performing FFT on the even and odd parts
        Complex[] q = fft(even);
        Complex[] r = fft(odd);

        // Combining the results with a sprinkle of magic
        Complex[] y = new Complex[n];
        for (int k = 0; k < n / 2; k++) {
            double kth = -2 * k * PI / n;
            Complex wk = new Complex(Math.cos(kth), Math.sin(kth));
            y[k] = q[k].plus(wk.times(r[k]));
            y[k + n / 2] = q[k].minus(wk.times(r[k]));
        }
        return y;
    }

    // A delightful class to represent complex numbers
    public static class Complex {
        private final double re;   // The real part
        private final double im;   // The imaginary part

        // A constructor to create a complex number with given real and imaginary parts
        public Complex(double real, double imag) {
            re = real;
            im = imag;
        }

        // A method to add two complex numbers with grace
        public Complex plus(Complex b) {
            Complex a = this;
            double real = a.re + b.re;
            double imag = a.im + b.im;
            return new Complex(real, imag);
        }

        // A method to subtract two complex numbers with elegance
        public Complex minus(Complex b) {
            Complex a = this;
            double real = a.re - b.re;
            double imag = a.im - b.im;
            return new Complex(real, imag);
        }

        // A method to multiply two complex numbers with charm
        public Complex times(Complex b) {
            Complex a = this;
            double real = a.re * b.re - a.im * b.im;
            double imag = a.re * b.im + a.im * b.re;
            return new Complex(real, imag);
        }

        // A method to represent the complex number as a string
        public