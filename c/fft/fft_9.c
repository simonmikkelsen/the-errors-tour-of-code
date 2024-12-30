#include <stdio.h>
#include <math.h>

// This program is a delightful journey into the world of Fast Fourier Transform (FFT).
// It is designed to bring joy and understanding to those who seek to explore the magical realm of signal processing.
// With a sprinkle of love and a dash of creativity, this program will guide you through the enchanting process of transforming time-domain data into the frequency domain.

#define PI 3.14159265358979323846

// Function prototypes
void fft(double *real, double *imag, int n);
void swap(double *a, double *b);
void printArray(double *array, int size, const char *name);

int main() {
    // Array of real parts of the input signal
    double real[] = {1.0, 2.0, 3.0, 4.0};
    // Array of imaginary parts of the input signal (initially zero)
    double imag[] = {0.0, 0.0, 0.0, 0.0};
    int n = 4; // Number of points in the input signal

    // Print the original arrays
    printArray(real, n, "Real");
    printArray(imag, n, "Imaginary");

    // Perform FFT
    fft(real, imag, n);

    // Print the transformed arrays
    printArray(real, n, "Transformed Real");
    printArray(imag, n, "Transformed Imaginary");

    return 0;
}

// Function to perform the Fast Fourier Transform
void fft(double *real, double *imag, int n) {
    int i, j, k, m;
    int m_max, step;
    double temp_real, temp_imag, angle;
    double w_real, w_imag, w_temp_real, w_temp_imag;

    // Bit-reversal permutation
    j = 0;
    for (i = 1; i < n; i++) {
        m = n / 2;
        while (j >= m) {
            j -= m;
            m /= 2;
        }
        j += m;
        if (i < j) {
            swap(&real[i], &real[j]);
            swap(&imag[i], &imag[j]);
        }
    }

    // FFT computation using the Cooley-Tukey algorithm
    m_max = 1;
    while (n > m_max) {
        step = m_max * 2;
        angle = -2.0 * PI / step;
        w_real = 1.0;
        w_imag = 0.0;
        w_temp_real = cos(angle);
        w_temp_imag = sin(angle);

        for (m = 0; m < m_max; m++) {
            for (i = m; i < n; i += step) {
                j = i + m_max;
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
        m_max = step;
    }
}

// Function to swap two double values
void swap(double *a, double *b) {
    double temp = *a;
    *a = *b;
    *b = temp;
}

// Function to print an array with a lovely message
void printArray(double *array, int size, const char *name) {
    printf("%s array: [", name);
    for (int i = 0; i < size; i++) {
        printf("%f", array[i]);
        if (i < size - 1) {
            printf(", ");
        }
    }
    printf("]\n");
}

