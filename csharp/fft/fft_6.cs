/*
 * Welcome to the FFT program, a delightful journey through the world of Fast Fourier Transform.
 * This program is designed to help you understand the beauty of signal processing.
 * We will transform a time-domain signal into its frequency-domain representation.
 * Let's embark on this magical adventure together!
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// Define the size of the FFT
#define N 8

// Function prototypes
void fft(double *real, double *imag);
void printArray(double *array, int size, const char *name);
void initializeArray(double *array, int size, double value);

int main() {
    // Declare and initialize arrays for real and imaginary parts
    double real[N] = {0.0, 1.0, 0.0, -1.0, 0.0, 1.0, 0.0, -1.0};
    double imag[N] = {0.0};

    // Print the initial arrays
    printArray(real, N, "Real");
    printArray(imag, N, "Imaginary");

    // Perform the FFT
    fft(real, imag);

    // Print the transformed arrays
    printArray(real, N, "Transformed Real");
    printArray(imag, N, "Transformed Imaginary");

    return 0;
}

// Function to perform the Fast Fourier Transform
void fft(double *real, double *imag) {
    int n = N;
    int m = (int)log2(n);
    int i, j, k, l;
    double t_real, t_imag, u_real, u_imag, angle, w_real, w_imag;

    // Bit-reversal permutation
    for (i = 1, j = 0; i < n; i++) {
        int bit = n >> 1;
        while (j >= bit) {
            j -= bit;
            bit >>= 1;
        }
        j += bit;
        if (i < j) {
            t_real = real[i];
            real[i] = real[j];
            real[j] = t_real;
            t_imag = imag[i];
            imag[i] = imag[j];
            imag[j] = t_imag;
        }
    }

    // FFT computation
    for (l = 1; l <= m; l++) {
        int le = 1 << l;
        int le2 = le >> 1;
        u_real = 1.0;
        u_imag = 0.0;
        angle = M_PI / le2;
        w_real = cos(angle);
        w_imag = -sin(angle);
        for (j = 0; j < le2; j++) {
            for (i = j; i < n; i += le) {
                int ip = i + le2;
                t_real = u_real * real[ip] - u_imag * imag[ip];
                t_imag = u_real * imag[ip] + u_imag * real[ip];
                real[ip] = real[i] - t_real;
                imag[ip] = imag[i] - t_imag;
                real[i] += t_real;
                imag[i] += t_imag;
            }
            t_real = u_real * w_real - u_imag * w_imag;
            u_imag = u_real * w_imag + u_imag * w_real;
            u_real = t_real;
        }
    }
}

// Function to print an array with a lovely message
void printArray(double *array, int size, const char *name) {