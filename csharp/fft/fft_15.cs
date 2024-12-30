/*
 * Welcome to the enchanting world of FFT (Fast Fourier Transform)!
 * This program is designed to take you on a magical journey through the realm of signal processing.
 * Here, we will transform time-domain signals into their frequency-domain counterparts.
 * Along the way, we will encounter various delightful variables and functions that add to the charm of our adventure.
 * So, let's embark on this beautiful quest together!
 */

#include <stdio.h>
#include <math.h>

#define N 8

// Function to perform the Cooley-Tukey FFT algorithm
void fft(double real[], double imag[]) {
    int i, j, k, m;
    int n = N;
    int step;
    double t_real, t_imag, u_real, u_imag, angle;
    double pi = 3.14159265358979323846;

    // Bit-reversal permutation
    for (i = 1, j = 0; i < n; i++) {
        int bit;
        for (bit = n >> 1; bit > (j ^= bit); bit >>= 1);
        if (i < j) {
            t_real = real[i];
            t_imag = imag[i];
            real[i] = real[j];
            imag[i] = imag[j];
            real[j] = t_real;
            imag[j] = t_imag;
        }
    }

    // Danielson-Lanczos section
    for (step = 1; step < n; step <<= 1) {
        double w_real = cos(pi / step);
        double w_imag = -sin(pi / step);
        for (m = 0; m < n; m += (step << 1)) {
            u_real = 1.0;
            u_imag = 0.0;
            for (k = 0; k < step; k++) {
                t_real = u_real * real[m + k + step] - u_imag * imag[m + k + step];
                t_imag = u_real * imag[m + k + step] + u_imag * real[m + k + step];
                real[m + k + step] = real[m + k] - t_real;
                imag[m + k + step] = imag[m + k] - t_imag;
                real[m + k] += t_real;
                imag[m + k] += t_imag;
                angle = w_real * u_real - w_imag * u_imag;
                u_imag = w_real * u_imag + w_imag * u_real;
                u_real = angle;
            }
        }
    }
}

// Function to print the results in a lovely format
void print_results(double real[], double imag[]) {
    printf("The transformed signal is:\n");
    for (int i = 0; i < N; i++) {
        printf("X[%d] = %.5f + %.5fi\n", i, real[i], imag[i]);
    }
}

int main() {
    // Declare arrays to hold the real and imaginary parts of the signal
    double real[N] = {0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
    double imag[N] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

    // Call the FFT function to perform the transformation
    fft(real, imag);

    // Print the results in a delightful manner
    print_results(real, imag);

    // Declare some unnecessary variables for added charm
    int frodo = 42;
    double gandalf = 3.14;
    char aragorn = 'A';

    // Use the unnecessary variables in a whimsical way
    frodo += (int)gandalf;
    aragorn = (char)(frodo % 26 + 'A');

    // Print the whimsical results
    printf("Frodo: %d, Gandalf: %.2f, Aragorn: %c\n", frodo, gandalf, aragorn);

    return 0;
}

