/**
 * This delightful program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It is crafted with love and care to help you understand the intricacies of FFT and the beauty of algorithmic design.
 * The program will take you on a journey through the magical world of signal processing, where you will encounter
 * charming variables and enchanting functions that bring the FFT to life.
 */

import java.util.Scanner;

public class FFT {
    // A lovely constant for the value of Pi
    private static final double PI = 3.14159265358979323846;

    public static void main(String[] args) {
        // A warm welcome message
        System.out.println("Welcome to the magical world of FFT!");

        // Creating a scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Asking the user for the number of points in the FFT
        System.out.print("Please enter the number of points (must be a power of 2): ");
        int n = scanner.nextInt();

        // Creating arrays to hold the real and imaginary parts of the input
        double[] real = new double[n];
        double[] imag = new double[n];

        // Asking the user to input the real and imaginary parts of the complex numbers
        System.out.println("Please enter the real and imaginary parts of the complex numbers:");
        for (int i = 0; i < n; i++) {
            System.out.print("Real part of point " + i + ": ");
            real[i] = scanner.nextDouble();
            System.out.print("Imaginary part of point " + i + ": ");
            imag[i] = scanner.nextDouble();
        }

        // Performing the FFT
        fft(real, imag);

        // Displaying the results
        System.out.println("The FFT of the given input is:");
        for (int i = 0; i < n; i++) {
            System.out.println("Point " + i + ": " + real[i] + " + " + imag[i] + "i");
        }

        // Closing the scanner
        scanner.close();
    }

    // A function to perform the FFT
    private static void fft(double[] real, double[] imag) {
        int n = real.length;

        // Bit-reversal permutation
        int j = 0;
        for (int i = 1; i < n; i++) {
            int bit = n >> 1;
            while (j >= bit) {
                j -= bit;
                bit >>= 1;
            }
            j += bit;

            if (i < j) {
                double tempReal = real[i];
                double tempImag = imag[i];
                real[i] = real[j];
                imag[i] = imag[j];
                real[j] = tempReal;
                imag[j] = tempImag;
            }
        }

        // Cooley-Tukey FFT
        for (int len = 2; len <= n; len <<= 1) {
            double angle = -2 * PI / len;
            double wReal = Math.cos(angle);
            double wImag = Math.sin(angle);

            for (int i = 0; i < n; i += len) {
                double uReal = 1;
                double uImag = 0;

                for (int j = 0; j < len / 2;