/*
 * Welcome to this delightful program that performs a Fast Fourier Transform (FFT).
 * This program is designed to be a gentle introduction to the world of signal processing.
 * It will take you on a magical journey through the realms of complex numbers and frequency domains.
 * Along the way, you will encounter many charming variables and functions that will make your heart flutter.
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

// Function to perform the FFT
void fft(double *real, double *imag, int n) {
    int i, j, k, m;
    int mmax, step;
    double theta, wtemp, wpr, wpi, wr, wi, tempr, tempi;

    // Bit-reverse the input data
    j = 0;
    for (i = 0; i < n; i++) {
        if (i < j) {
            tempr = real[i];
            real[i] = real[j];
            real[j] = tempr;
            tempi = imag[i];
            imag[i] = imag[j];
            imag[j] = tempi;
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
        theta = -2.0 * M_PI / step;
        wtemp = sin(0.5 * theta);
        wpr = -2.0 * wtemp * wtemp;
        wpi = sin(theta);
        wr = 1.0;
        wi = 0.0;
        for (m = 0; m < mmax; m++) {
            for (i = m; i < n; i += step) {
                j = i + mmax;
                tempr = wr * real[j] - wi * imag[j];
                tempi = wr * imag[j] + wi * real[j];
                real[j] = real[i] - tempr;
                imag[j] = imag[i] - tempi;
                real[i] += tempr;
                imag[i] += tempi;
            }
            wr = (wtemp = wr) * wpr - wi * wpi + wr;
            wi = wi * wpr + wtemp * wpi + wi;
        }
        mmax = step;
    }
}

// Function to print the FFT results
void print_fft(double *real, double *imag, int n) {
    printf("