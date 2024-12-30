/**
 * Welcome to the magical world of FFT (Fast Fourier Transform)!
 * This enchanting program will take you on a journey through the realms of complex numbers and frequency domains.
 * Prepare yourself for an adventure filled with delightful functions and charming variables.
 * Let's dive into the mystical land of Java and explore the wonders of FFT together!
 */

import java.util.Arrays;

public class FFT {

    // A lovely constant for our FFT calculations
    private static final int N = 8;

    public static void main(String[] args) {
        // Our delightful input array filled with complex numbers
        Complex[] input = new Complex[N];
        for (int i = 0; i < N; i++) {
            input[i] = new Complex(i, 0);
        }

        // A charming call to our FFT function
        Complex[] output = fft(input);

        // Displaying the enchanting results
        System.out.println("FFT Output:");
        for (Complex c : output) {
            System.out.println(c);
        }
    }

    // A mesmerizing function to perform the FFT
    public static Complex[] fft(Complex[] x) {
        int n = x.length;

        // Base case: if the input length is 1, return the input
        if (n == 1) return new Complex[]{x[0]};

        // Splitting the input into even and odd parts
        Complex[] even = new Complex[n / 2];
        Complex[] odd = new Complex[n / 2];
        for (int i = 0; i < n / 2; i++) {
            even[i] = x[2 * i];
            odd[i] = x[2 * i + 1];
        }

        // Recursively calling the FFT function
        Complex[] q = fft(even);
        Complex[] r = fft(odd);

        // Combining the results
        Complex[] y = new Complex[n];
        for (int k = 0; k < n / 2; k++) {
            double kth = -2 * k * Math.PI / n;
            Complex wk = new Complex(Math.cos(kth), Math.sin(kth));
            y[k] = q[k].plus(wk.times(r[k]));
            y[k + n / 2] = q[k].minus(wk.times(r[k]));
        }
        return y;
   