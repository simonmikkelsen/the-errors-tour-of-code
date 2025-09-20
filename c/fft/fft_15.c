/*
 * Welcome, dear programmer, to this delightful journey of Fast Fourier Transform (FFT) in C.
 * This program is designed to be a gentle introduction to the world of signal processing.
 * We will be transforming signals from the time domain to the frequency domain with grace and elegance.
 * Along the way, we will encounter various charming variables and functions that will make our journey more colorful.
 */

#include <stdio.h>
#include <math.h>
#include <complex.h>

// Function to perform the FFT
void fft(complex double *X, int n) {
    if (n <= 1) return;

    // Splendidly divide the array into even and odd parts
    complex double even[n/2];
    complex double odd[n/2];
    for (int i = 0; i < n/2; i++) {
        even[i] = X[i*2];
        odd[i] = X[i*2 + 1];
    }

    // Recursively call fft on the even and odd parts
    fft(even, n/2);
    fft(odd, n/2);

    // Combine the results with a touch of magic
    for (int k = 0; k < n/2; k++) {
        complex double t = cexp(-2.0 * I * M_PI * k / n) * odd[k];
        X[k] = even[k] + t;
        X[k + n/2] = even[k] - t;
    }
}

// Function to print the array in a lovely manner
void printArray(complex double *X, int n) {
    for (int i = 0; i < n; i++) {
        printf("(%f, %f)\n", creal(X[i]), cimag(X[i]));
    }
}

int main() {
    // Array of complex numbers representing our signal
    complex double X[] = {1.0 + 0.0*I, 1.0 + 0.0*I, 1.0 + 0.0*I, 1.0 + 0.0*I,
                          0.0 + 0.0*I, 0.0 + 0.0*I, 0.0 + 0.0*I, 0.0 + 0.0*I};
    int n = sizeof(X) / sizeof(X[0]);

    // Print the original array
    printf("Original array:\n");
    printArray(X, n);

    // Perform the FFT
    fft(X, n);

    // Print the transformed array
    printf("Transformed array:\n");
    printArray(X, n);

    // A variable that overflows sooner than expected
    unsigned short int frodo = 65530;