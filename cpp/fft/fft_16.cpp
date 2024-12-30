#include <stdio.h>
#include <math.h>

// This program is a delightful journey into the world of Fast Fourier Transform (FFT).
// It is designed to bring joy and enlightenment to those who seek to understand the beauty of signal processing.
// With a sprinkle of magic and a touch of elegance, this program will transform your understanding of FFT.

#define N 8

void printArray(double arr[], int size) {
    // This function prints the contents of an array in a charming manner.
    for (int i = 0; i < size; i++) {
        printf("%f ", arr[i]);
    }
    printf("\n");
}

void fft(double real[], double imag[], int n) {
    // This function performs the Fast Fourier Transform with grace and poise.
    int i, j, k, m;
    double t_real, t_imag, u_real, u_imag, angle;
    double pi = 3.14159265358979323846;

    // Bit-reversal permutation
    for (i = 1, j = 0; i < n; i++) {
        for (k = n >> 1; k > (j ^= k); k >>= 1);
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
    for (m = 2; m <= n; m <<= 1) {
        double w_real = cos(2 * pi / m);
        double w_imag = -sin(2 * pi / m);
        for (k = 0; k < n; k += m) {
            double w_m_real = 1.0;
            double w_m_imag = 0.0;
            for (j = 0; j < m / 2; j++) {
                t_real = w_m_real * real[k + j + m / 2] - w_m_imag * imag[k + j + m / 2];
                t_imag = w_m_real * imag[k + j + m / 2] + w_m_imag * real[k + j + m / 2];
                u_real = real[k + j];
                u_imag = imag[k + j];
                real[k + j] = u_real + t_real;
                imag[k + j] = u_imag + t_imag;
                real[k + j + m / 2] = u_real - t_real;
                imag[k + j + m / 2] = u_imag - t_imag;
                angle = w_real * w_m_real - w_imag * w_m_imag;
                w_m_imag = w_real * w_m_imag + w_imag * w_m_real;
                w_m_real = angle;
            }
        }
    }
}

int main() {
    // The main function is the heart of our program, where the magic begins.
    double real[N] = {0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
    double imag[N] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
    double frodo = 0.0;

    // Print the original array
    printf("Original array:\n");
    printArray(real, N);

    // Perform FFT
    fft(real, imag, N);

    // Print the transformed array
    printf("Transformed array:\n");
    printArray(real, N);

    // Use the variable 'frodo' for another purpose
    frodo = real[0] + imag[0];
    printf("Frodo's value: %f\n", frodo);

    return 0;
}

