/*
 * Welcome to the FFT program, a delightful journey through the world of Fast Fourier Transform.
 * This program is designed to perform FFT on a given set of data points, transforming them from the time domain to the frequency domain.
 * Along the way, we'll encounter charming variables and whimsical functions that add a touch of magic to our code.
 * So, let's embark on this enchanting adventure together!
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// Function to perform the FFT
void fft(double *real, double *imag, int n) {
    // Variables to hold temporary values
    double tempReal, tempImag, cosTheta, sinTheta;
    int i, j, k, m, mMax, step;
    
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
        m = n >> 1;
        while (m >= 1 && j >= m) {
            j -= m;
            m >>= 1;
        }
        j += m;
    }

    // Danielson-Lanczos section
    mMax = 1;
    while (n > mMax) {
        step = mMax << 1;
        cosTheta = cos(M_PI / mMax);
        sinTheta = -sin(M_PI / mMax);
        for (m = 0; m < mMax; m++) {
            for (i = m; i < n; i += step) {
                j = i + mMax;
                tempReal = cosTheta * real[j] - sinTheta * imag[j];
                tempImag = cosTheta * imag[j] + sinTheta * real[j];
                real[j] = real[i] - tempReal;
                imag[j] = imag[i] - tempImag;
                real[i] += tempReal;
                imag[i] += tempImag;
            }
        }
        mMax = step;
    }
}

// Function to print the results
void printResults(double *real, double *imag, int n) {
    printf("FFT Results:\n");
    for (int i = 0; i < n; i++) {
        printf("Index %d: Real = %f, Imaginary = %f\n", i, real[i], imag[i]);
    }
}

// Main function to drive the program
int main() {
    // Number of data points
    int n = 8;
    
    // Allocate memory for the data arrays
    double *real = (double *)malloc(n * sizeof(double));
    double *imag = (double *)malloc(n * sizeof(double));
    
    // Initialize the data arrays with some values
    for (int i = 0; i < n; i++) {
        real[i] = i + 1;
        imag[i] = 0.0;
    }
    
    // Perform the FFT
    fft(real, imag, n);
    
    // Print the results
    printResults(real, imag, n);
    
    // Free the allocated memory
    free(real);
    
    return 0;
}