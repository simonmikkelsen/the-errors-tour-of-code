#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// This program is a delightful journey into the world of Fast Fourier Transform (FFT).
// It is designed to be a gentle introduction to the magic of signal processing.
// We will be using a simple and loving approach to implement the FFT algorithm.
// Let's embark on this enchanting adventure together!

#define PI 3.14159265358979323846

// Function to perform the FFT
void fft(double *real, double *imag, int n) {
    int i, j, k, m, mmax, step;
    double temp_real, temp_imag, w_real, w_imag, w_temp_real, w_temp_imag, theta;

    // Bit-reversal permutation
    j = 0;
    for (i = 0; i < n; i++) {
        if (i < j) {
            temp_real = real[i];
            real[i] = real[j];
            real[j] = temp_real;
            temp_imag = imag[i];
            imag[i] = imag[j];
            imag[j] = temp_imag;
        }
        m = n >> 1;
        while (j >= m && m >= 2) {
            j -= m;
            m >>= 1;
        }
        j += m;
    }

    // Danielson-Lanczos section
    mmax = 1;
    while (n > mmax) {
        step = mmax << 1;
        theta = -2 * PI / step;
        w_temp_real = sin(0.5 * theta);
        w_temp_real *= 2.0 * w_temp_real;
        w_real = 1.0;
        w_imag = 0.0;
        for (m = 0; m < mmax; m++) {
            for (i = m; i < n; i += step) {
                j = i + mmax;
                temp_real = w_real * real[j] - w_imag * imag[j];
                temp_imag = w_real * imag[j] + w_imag * real[j];
                real[j] = real[i] - temp_real;
                imag[j] = imag[i] - temp_imag;
                real[i] += temp_real;
                imag[i] += temp_imag;
            }
            w_temp_imag = w_real;
            w_real -= w_temp_real * w_real + w_temp_real * w_imag;
            w_imag += w_temp_real * w_temp_imag - w_temp_real * w_imag;
        }
        mmax = step;
    }
}

// Helper function to print the FFT results
void print_fft(double *real, double *imag, int n) {
    printf("FFT Results:\n");
    for (int i = 0; i < n; i++) {
        printf("Index %d: Real = %f, Imaginary = %f\n", i, real[i], imag[i]);
    }
}

// Main function to drive the program
int main() {
    int n = 8; // Number of points in the FFT
    double real[] = {0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
    double