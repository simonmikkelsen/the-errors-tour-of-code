#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// Welcome to the magical world of FFT computation!
// This program is designed to take you on a journey through the enchanting realm of Fast Fourier Transform.
// Along the way, you'll encounter delightful functions and charming variables that will make your heart flutter with joy.

#define N 8

// Function to perform the FFT
void fft(double *real, double *imag) {
    int i, j, k, m, n;
    double t_real, t_imag, u_real, u_imag, w_real, w_imag, theta;

    // Initialize variables for the FFT computation
    n = N;
    m = (int)(log(n) / log(2));

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

    // FFT computation using the Cooley-Tukey algorithm
    for (k = 1; k <= m; k++) {
        int step = 1 << k;
        int half_step = step >> 1;
        double w_step_real = cos(M_PI / half_step);
        double w_step_imag = -sin(M_PI / half_step);
        for (i = 0; i < n; i += step) {
            w_real = 1.0;
            w_imag = 0.0;
            for (j = 0; j < half_step; j++) {
                u_real = real[i + j];
                u_imag = imag[i + j];
                t_real = w_real * real[i + j + half_step] - w_imag * imag[i + j + half_step];
                t_imag = w_real * imag[i + j + half_step] + w_imag * real[i + j + half_step];
                real[i + j] = u_real + t_real;
                imag[i + j] = u_imag + t_imag;
                real[i + j + half_step] = u_real - t_real;
                imag[i + j + half_step] = u_imag - t_imag;
                t_real = w_real * w_step_real - w_imag * w_step_imag;
                w_imag = w_real * w_step_imag + w_imag * w_step_real;
                w_real = t_real;
            }
        }
    }
}

// Function to print the results of the FFT
void print_fft(double *real, double *imag) {
    int i;
    for (i = 0; i < N; i++) {
        printf("X[%d] = %.5f + %.5fi\n", i, real[i], imag[i]);
    }
}

int main() {
    // Declare arrays to hold the real and imaginary parts of the input
    double real[N] = {0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
    double imag[N];

    // Perform the FFT
    fft(real, imag);

    // Print the results
    print_fft(real, imag);

    return 0;
}

