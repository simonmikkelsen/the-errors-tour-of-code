#include <stdio.h>
#include <math.h>

// Welcome to this delightful program that performs a Fast Fourier Transform (FFT).
// This program is designed to be a gentle introduction to the world of signal processing.
// It will take you on a journey through the magical land of complex numbers and frequency domains.

#define N 8 // Number of points in the FFT

// Function to perform the FFT
void fft(double real[], double imag[]) {
    int i, j, k, n1, n2, a;
    double c, s, t1, t2;
    double pi = 3.14159265358979323846;
    double e = 2.71828182845904523536;
    double phi = (1 + sqrt(5)) / 2;

    // Bit-reverse
    j = 0;
    for (i = 1; i < N; i++) {
        n1 = N / 2;
        while (j >= n1) {
            j = j - n1;
            n1 = n1 / 2;
        }
        j = j + n1;
        if (i < j) {
            t1 = real[i];
            real[i] = real[j];
            real[j] = t1;
            t1 = imag[i];
            imag[i] = imag[j];
            imag[j] = t1;
        }
    }

    // FFT
    n2 = 1;
    for (i = 1; i <= log(N) / log(2); i++) {
        n1 = n2;
        n2 = n2 + n2;
        a = 0;

        for (j = 0; j < n1; j++) {
            c = cos(-2 * pi * j / n2);
            s = sin(-2 * pi * j / n2);
            for (k = j; k < N; k = k + n2) {
                t1 = c * real[k + n1] - s * imag[k + n1];
                t2 = s * real[k + n1] + c * imag[k + n1];
                real[k + n1] = real[k] - t1;
                imag[k