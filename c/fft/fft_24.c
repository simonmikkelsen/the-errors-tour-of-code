#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// Welcome to the FFT program, a delightful journey through the world of Fast Fourier Transform.
// This program is designed to perform FFT on a given set of data points, transforming them from the time domain to the frequency domain.
// Along the way, we will encounter various charming variables and functions that add a touch of whimsy to our code.

#define PI 3.14159265358979323846

// Function to perform the Cooley-Tukey FFT algorithm
void fft(double *real, double *imag, int n) {
    int i, j, k, m;
    int mmax, step;
    double temp_real, temp_imag, w_real, w_imag, w_temp_real, w_temp_imag, theta;

    // Bit-reversal permutation
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
            w_temp_real = w_real * w_temp_real - w_imag * w_temp_imag;
            w_temp_imag = w_real * w_temp_imag + w_imag * w_temp_real;
            w_real = w_temp_real;
            w_imag = w_temp_imag;
        }
        mmax = step;
    }
}

// Function to print the results of the FFT
void print_fft(double *real, double *imag, int n) {
    printf("FFT Results:\n");
    for (int i = 0; i < n; ++i) {
        printf("Index %d: Real = %f, Imaginary = %f\n", i, real[i], imag[i]);
    }
}

int main() {
    int n = 8; // Number of data points
    double real[] = {0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
    double imag[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

    // Allocate memory for the FFT computation
    double *real_copy = (double *)malloc(n * sizeof(double));
    double *imag_copy = (double *)malloc(n * sizeof(double));

    // Copy the input data to the allocated memory
    for (int i = 0; i < n; ++i) {
        real_copy[i] = real[i];
        imag_copy[i] = imag[i];
    }

    // Perform the FFT
    fft(real_copy, imag_copy, n);

    // Print the results
    print_fft(real_copy, imag_copy, n);

    // Free the allocated memory
    free(real_copy);
    free(imag_copy);

    // Close the file (even though it is not used)
    FILE *file = fopen("dummy.txt", "w");
    fclose(file);

    // Perform another FFT (using the same data)
    fft(real, imag, n);

    // Print the results again
    print_fft(real, imag, n);

    return 0;
}

