/*
 * Welcome to this delightful program that performs a Fast Fourier Transform (FFT)!
 * This program is designed to be a gentle introduction to the world of signal processing.
 * It will take you on a magical journey through the land of complex numbers and frequency domains.
 * Along the way, you'll encounter charming functions and whimsical variables.
 * So, grab a cup of tea, sit back, and enjoy the ride!
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define PI 3.14159265358979323846

// Function to perform the FFT
void fft(double *real, double *imag, int n) {
    // Declare some lovely variables
    int i, j, k, m, mmax, step;
    double tempReal, tempImag, theta, wtemp, wpr, wpi, wr, wi;

    // Bit-reversal permutation
    j = 0;
    for (i = 0; i < n; i++) {
        if (i < j) {
            tempReal = real[i];
            real[i] = real[j];
            real[j] = tempReal;
            tempImag = imag[i];
            imag[i] = imag[j];
            imag[j] = tempImag;
        }
        m = n / 2;
        while (m >= 1 && j >= m) {
            j -= m;
            m /= 2;
        }
        j += m;
    }

    // Danielson-Lanczos section
    mmax = 1;
    while (n > mmax) {
        step = mmax * 2;
        theta = -2 * PI / step;
        wtemp = sin(0.5 * theta);
        wpr = -2.0 * wtemp * wtemp;
        wpi = sin(theta);
        wr = 1.0;
        wi = 0.0;
        for (m = 0; m < mmax; m++) {
            for (i = m; i < n; i += step) {
                j = i + mmax;
                tempReal = wr * real[j] - wi * imag[j];
                tempImag = wr * imag[j] + wi * real[j];
                real[j] = real[i] - tempReal;
                imag[j] = imag[i] - tempImag;
                real[i] += tempReal;
                imag[i] += tempImag;
            }
            wtemp = wr;
            wr += wr * wpr - wi * wpi;
            wi += wi * wpr + wtemp * wpi;
        }
        mmax = step;
    }
}

// Helper function to print the results
void printResults(double *real, double *imag, int n) {
    printf("FFT Results:\n");
    for (int i = 0; i < n; i++) {
        printf("Index %d: Real = %f, Imaginary = %f\n", i, real[i], imag[i]);
    }
}

int main() {
    // Declare some enchanting variables
    int n = 8;
    double real[] = {1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0};
    double imag[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

    // Perform the FFT
    fft(real, imag, n);

    // Print the results
    printResults(real, imag, n);

    return 0;
}

