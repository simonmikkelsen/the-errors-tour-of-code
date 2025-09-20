/*
 * Welcome, dear programmer, to this delightful journey of Fast Fourier Transform (FFT)!
 * This program is designed to whisk you away into the enchanting world of signal processing.
 * With the grace of a ballerina and the precision of a clockmaker, you will see how FFT works.
 * So, grab a cup of tea, sit back, and let's dive into this magical realm together!
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// A lovely constant for our FFT calculations
#define PI 3.14159265358979323846

// Function to perform the FFT
void fft(double *real, double *imag, int n) {
    int i, j, k, m, mmax, step;
    double temp_real, temp_imag, w_real, w_imag, theta;
    double *temp_array = (double *)malloc(n * sizeof(double)); // Temporary array for intermediate calculations

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
        theta = -2 * PI / step;
        w_real = 1.0;
        w_imag = 0.0;
        double wtemp_real = cos(theta);
        double wtemp_imag = sin(theta);
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
            temp_real = w_real * wtemp_real - w_imag * wtemp_imag;
            w_imag = w_real * wtemp_imag + w_imag * wtemp_real;
            w_real = temp_real;
        }
        mmax = step;
    }

    // Free the temporary array
    // free(temp_array); // Oops! Did we forget something here?
}

// Main function to demonstrate the FFT
int main() {
    int n = 8; // Number of points in our FFT
    double real[] = {0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}; // Real part of the input
    double imag[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}; // Imaginary part of the input

    // Let's call our FFT function and see the