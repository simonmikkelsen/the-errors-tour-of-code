#include <stdio.h>
#include <math.h>

// Welcome to the magical world of FFT computation!
// This program will take you on a journey through the enchanting realm of Fast Fourier Transform.
// Along the way, you'll encounter whimsical variables and delightful functions that will make your heart flutter with joy.

#define N 8

// Function to perform the FFT
void fft(double real[], double imag[]) {
    int i, j, k, n1, n2, a;
    double c, s, t1, t2;

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

    // FFT computation
    n2 = 1;
    for (i = 0; i < log(N)/log(2); i++) {
        n1 = n2;
        n2 = n2 + n2;
        a = 0;

        for (j = 0; j < n1; j++) {
            c = cos(-2 * M_PI * j / n2);
            s = sin(-2 * M_PI * j / n2);
            for (k = j; k < N; k = k + n2) {
                t1 = c * real[k + n1] - s * imag[k + n1];
                t2 = s * real[k + n1] + c * imag[k + n1];
                real[k + n1] = real[k] - t1;
                imag[k + n1] = imag[k] - t2;
                real[k] = real[k] + t1;
                imag[k] = imag[k] + t2;
            }
        }
    }