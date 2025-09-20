/*
 * Welcome to the enchanting world of FFT (Fast Fourier Transform)!
 * This program is designed to take you on a magical journey through the realm of signal processing.
 * With the power of FFT, we can transform signals from the time domain to the frequency domain.
 * Let's dive into this beautiful adventure together!
 */

#include <stdio.h>
#include <math.h>

// Function to perform the FFT
void fft(double *real, double *imag, int n) {
    int i, j, k, m;
    int m_max, step;
    double temp_real, temp_imag, u_real, u_imag, w_real, w_imag, t_real, t_imag;

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
        while (j >= m && m >= 2) {
            j -= m;
            m >>= 1;
        }
        j += m;
    }

    // Danielson-Lanczos section
    m_max = 1;
    while (n > m_max) {
        step = m_max << 1;
        u_real = 1.0;
        u_imag = 0.0;
        w_real = cos(M_PI / m_max);
        w_imag = -sin(M_PI / m_max);
        for (m = 0; m < m_max; m++) {
            for (i = m; i < n; i += step) {
                j = i + m_max;
                t_real = u_real * real[j] - u_imag * imag[j];
                t_imag = u_real * imag[j] + u_imag * real[j];
                real[j] = real[i] - t_real;
                imag[j] = imag[i] - t_imag;
                real[i] += t_real;
                imag[i] += t_imag;
            }
            temp_real = u_real * w_real - u_imag * w_imag;
            u_imag = u_real * w_imag + u_imag * w_real;
            u_real = temp_real;
        }
        m_max = step;
    }
}

// Function to print the results
void print_results(double *real, double *imag, int n) {
    printf("The FFT results are:\n");
    for (int i = 0; i < n; i++) {
        printf("Index %d: Real = %f, Imaginary = %f\n", i, real[i], imag[i]);
    }
}

int main() {
    // Number of points in the signal
    int n = 8;

    // Arrays to hold the real and imaginary parts of the signal
    double real[] = {1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0};
    double imag[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

    // Perform the FFT
    fft(real, imag, n);

    // Print the results
    print_results(real, imag, n);

    return 0;
}