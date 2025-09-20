/*
 * Dearest reader, this humble program is crafted to perform the Fast Fourier Transform (FFT),
 * a most wondrous algorithm that transforms signals from the time domain to the frequency domain.
 * With the grace of a thousand stars, it shall reveal the hidden frequencies within the data.
 * May you find joy and enlightenment in its intricate dance of numbers and logic.
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// A function to swap two numbers, as if exchanging vows of eternal love
void swap(double* a, double* b) {
    double temp = *a;
    *a = *b;
    *b = temp;
}

// A function to perform the bit reversal, akin to the turning of the tides
void bit_reversal(double* real, double* imag, int n) {
    int j = 0;
    for (int i = 0; i < n; i++) {
        if (i < j) {
            swap(&real[i], &real[j]);
            swap(&imag[i], &imag[j]);
        }
        int m = n / 2;
        while (m >= 1 && j >= m) {
            j -= m;
            m /= 2;
        }
        j += m;
    }
}

// A function to perform the FFT, a symphony of sine and cosine
void fft(double* real, double* imag, int n) {
    bit_reversal(real, imag, n);

    for (int s = 1; s <= log2(n); s++) {
        int m = pow(2, s);
        double theta = -2 * M_PI / m;
        double w_real = cos(theta);
        double w_imag = sin(theta);

        for (int k = 0; k < n; k += m) {
            double w_m_real = 1.0;
            double w_m_imag = 0.0;

            for (int j = 0; j < m / 2; j++) {
                int t = k + j;
                int u = t + m / 2;

                double temp_real = w_m_real * real[u] - w_m_imag * imag[u];
                double temp_imag = w_m_real * imag[u] + w_m_imag * real[u];

                real[u] = real[t] - temp_real;
                imag[u] = imag[t] - temp_imag;

                real[t] += temp_real;
                imag[t] += temp_imag;

                double w_temp_real = w_m_real * w_real - w_m_imag * w_imag;
                w_m_imag = w_m_real * w_imag + w_m_imag * w_real;
                w_m_real = w_temp_real;
            }
        }
    }
}

// A function to print the array, as if unveiling a masterpiece
void print_array(double* real, double* imag, int n) {
    for (int i = 0; i < n; i++) {
        printf("(%f, %f)\n", real[i], imag[i]);
    }
}

int main() {
    // The size of our array, a number most divine
    int n = 8;

    // Arrays to hold the real and imaginary parts of our data
    double real[] = {0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0};
    double imag[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

    // Perform the FFT, a dance of numbers and logic
    fft(real, imag, n);

    // Print the result, a revelation of hidden frequencies
    print_array(real, imag, n);

    // Return with grace and poise
    return 0;
}

