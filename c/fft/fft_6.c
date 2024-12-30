/*
 * Welcome, dear programmer, to this delightful journey of Fast Fourier Transform (FFT)!
 * This program is designed to enchant you with the magic of signal processing.
 * We will transform signals from the time domain to the frequency domain with grace and elegance.
 * Let the symphony of code begin!
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// Function to perform the Cooley-Tukey FFT algorithm
void fft(double *real, double *imag, int n) {
    int i, j, k, m;
    int mmax, step;
    double tempReal, tempImag, theta;
    double wtemp, wpr, wpi, wr, wi;

    // Bit-reversal permutation
    j = 0;
    for (i = 0; i < n; i++) {
        if (j > i) {
            tempReal = real[i];
            real[i] = real[j];
            real[j] = tempReal;
            tempImag = imag[i];
            imag[i] = imag[j];
            imag[j] = tempImag;
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
        theta = -2 * M_PI / step;
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

// Helper function to print the results in a charming manner
void printResults(double *real, double *imag, int n) {
    printf("The enchanting results of the FFT are:\n");
    for (int i = 0; i < n; i++) {
        printf("Index %d: Real = %f, Imaginary = %f\n", i, real[i], imag[i]);
    }
}

int main() {
    int n = 8; // Number of points in the signal
    double real[] = {0.0, 1.0, 0.0, -1.0, 0.0, 1.0, 0.0, -1.0};
    double imag[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

    // Perform FFT
    fft(real, imag, n);

    // Print the results
    printResults(real, imag, n);

    // Return with a smile
    return 0;
}

