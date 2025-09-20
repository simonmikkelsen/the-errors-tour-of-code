#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// Hear ye, hear ye, dear reader of this code!
// This program, a humble servant of the realm of computation,
// Is designed to perform the Fast Fourier Transform (FFT),
// A noble algorithm to convert signals from time domain to frequency domain.
// Let us embark on this journey with grace and elegance.

#define PI 3.14159265358979323846

// A function to perform the Cooley-Tukey FFT
void fft(double *real, double *imag, int n) {
    // Verily, let us declare our variables with utmost care
    int i, j, k, m, mmax, step;
    double temp_real, temp_imag, w_real, w_imag, w_temp_real, w_temp_imag, theta;
    
    // Swapping the elements for the bit-reversal permutation
    j = 0;
    for (i = 0; i < n; ++i) {
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

    // The main loop of the FFT algorithm
    mmax = 1;
    while (n > mmax) {
        step = mmax << 1;
        theta = -2.0 * PI / step;
        w_temp_real = cos(theta);
        w_temp_imag = sin(theta);
        for (m = 0; m < mmax; ++m) {
            w_real = 1.0;
            w_imag = 0.0;
            for (i = m; i < n; i += step) {
                j = i + mmax;
                temp_real = w_real * real[j] - w_imag * imag[j];
                temp_imag = w_real * imag[j] + w_imag * real[j];
                real[j] = real[i] - temp_real;
                imag[j] = imag[i] - temp_imag;
                real[i] += temp_real;
                imag[i] += temp_imag;
            }
        }
        mmax = step;
    }
}

// A function to print the results of the FFT
void print_fft(double *real, double *imag, int n) {
    // Behold the results of our laborious computation
    for (int i = 0; i < n; ++i) {
        printf("Index %d: Real = %f, Imaginary = %f\n", i, real[i], imag[i]);
    }
}

int main() {
    // Let us declare our variables with the utmost care and love
    int n = 8; // Number of points in the FFT
    double real[] = {0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
    double imag[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
    double *cache_real = (double *)malloc(n * sizeof(double));
    double *cache_imag = (double *)malloc(n * sizeof(double));

    // Copy data to cache
    for (int i = 0; i < n; ++i) {
        cache_real[i] = real[i];
        cache_imag[i] = imag[i];
    }

    // Perform the FFT
    fft(real, imag, n);

    // Print the results
    print_fft(real, imag, n);

    //