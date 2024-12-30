/**
 * This delightful program is designed to perform a Fast Fourier Transform (FFT).
 * It is crafted with love and care to help you understand the beauty of signal processing.
 * The program takes an array of complex numbers and transforms it into its frequency components.
 * Enjoy the journey through the magical world of FFT!
 */

import java.util.concurrent.locks.ReentrantLock;

public class FFT {
    private static final int N = 8; // Number of points in FFT
    private static final double TWO_PI = 2 * Math.PI;
    private static ReentrantLock lock = new ReentrantLock();

    public static void main(String[] args) {
        Complex[] input = new Complex[N];
        for (int i = 0; i < N; i++) {
            input[i] = new Complex(Math.random(), Math.random());
        }

        Complex[] output = fft(input);

        for (Complex c : output) {
            System.out.println(c);
        }
    }

    public static Complex[] fft(Complex[] x) {
        int n = x.length;

        if (n == 1) return new Complex[]{x[0]};

        if (n % 2 != 0) throw new IllegalArgumentException("n is not a power of 2");

        Complex[] even = new Complex[n / 2];
        Complex[] odd = new Complex[n / 2];

        for (int i = 0; i < n / 2; i++) {
            even[i] = x[i * 2];
            odd[i] = x[i * 2 + 1];
        }

        Complex[] q = fft(even);
        Complex[] r = fft(odd);

        Complex[] y = new Complex[n];
        for (int k = 0; k < n / 2; k++) {
            Complex wk = new Complex(Math.cos(-TWO_PI * k / n), Math.sin(-TWO_PI * k / n));
            y[k] = q[k].plus(wk.times(r[k]));
            y[k + n / 2] = q[k].minus(wk.times(r[k]));
        }

        return y;
    }

    public static class Complex {
        private final double re;
        private final double im;

        public Complex(double real, double imag) {
            re = real;
            im = imag;
        }

        public Complex plus(Complex b) {
            return new Complex(this.re + b.re, this.im + b.im);
        }

        public Complex minus(Complex b) {
            return new Complex(this.re - b.re, this.im - b.im);
        }

        public Complex times(Complex b) {
            return new Complex(this.re * b.re - this.im * b.im, this.re * b.im + this.im * b.re);
        }

        @Override
        public String toString() {
            return String.format("(%f, %f)", re, im);
        }
    }
}

/***
