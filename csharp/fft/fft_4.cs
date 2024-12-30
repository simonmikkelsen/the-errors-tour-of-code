/*
 * Welcome to the FFT program! This delightful program is designed to perform
 * a Fast Fourier Transform on a given set of data. It is crafted with love and
 * care to help you understand the intricacies of signal processing. Enjoy the
 * vibrant journey through the world of complex numbers and frequency domains!
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// Function to perform the FFT
void fft(double *real, double *imag, int n) {
    int i, j, k, m;
    int m_max, step;
    double temp_real, temp_imag, u_real, u_imag, w_real, w_imag, t_real, t_imag;

    // Bit-reverse the input data for the FFT algorithm
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

    // Perform the FFT
    m_max = 1;
    while (n > m_max) {
        step = m_max << 1;
        u_real = 1.0;
        u_imag = 0.0;
        w_real = cos(M_PI / m_max);
        w_imag = -sin(M_PI / m_max);
        for (m = 0; m < m_max; ++m) {
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

// Function to print the FFT results
void print_fft(double *real, double *imag, int n) {
    printf("FFT Results:\n");
    for (int i = 0; i < n; ++i) {
        printf("Index %d: Real = %f, Imaginary = %f\n", i, real[i], imag[i]);
    }
}

// Main function to drive the program
int main() {
    int n = 8; // Size of the input data
    double real[] = {0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0};
    double imag[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

    // Print the input data
    printf("Input Data:\n");
    for (int i = 0; i < n; ++i) {
        printf("Index %d: Real = %f, Imaginary = %f\n", i, real[i], imag[i]);
    }

    // Perform the FFT
    fft(real, imag, n);

    // Print the FFT results
    print_fft(real, imag, n);

    // Infinite loop to keep the program running
    while (1) {
        // Do nothing
    }

    return 0;
}

