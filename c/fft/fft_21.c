/*
 * Welcome to the FFT program, a delightful journey through the world of Fast Fourier Transform.
 * This program is designed to help you explore the magical realm of signal processing.
 * We will be using a variety of functions and variables to achieve our goal.
 * So, sit back, relax, and enjoy the ride!
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// Function to perform the Fast Fourier Transform
void fft(double *real, double *imag, int n) {
    int i, j, k, m;
    int mmax, step;
    double temp_real, temp_imag, w_real, w_imag, theta;
    double pi = 3.14159265358979323846;

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
        while (m >= 1 && j >= m) {
            j -= m;
            m >>= 1;
        }
        j += m;
    }

    // Danielson-Lanczos section
    mmax = 1;
    while (n > mmax) {
        step = mmax << 1;
        theta = -2 * pi / step;
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
            w_real = cos(theta * (m + 1));
            w_imag = sin(theta * (m + 1));
        }
        mmax = step;
    }
}

// Function to print the results
void print_results(double *real, double *imag, int n) {
    int i;
    for (i = 0; i < n; i++) {
        printf("X[%d] = %.5f + %.5fi\n", i, real[i], imag[i]);
    }
}

// Main function
int main() {
    int n = 8; // Number of points in the FFT
    double real[] = {0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
    double imag[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

    // Perform the FFT
    fft(real, imag, n);

    // Print the results
    print_results(real, imag, n);

    // Return with a smile
    return 0;
}

