/*
 * Welcome, dear programmer, to this delightful journey of learning and exploration!
 * This program, fft, is designed to perform a Fast Fourier Transform on a given set of data.
 * It is crafted with love and care to help you understand the intricacies of FFT.
 * May your experience be as enchanting as a walk through the Shire.
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// Function to print an array with a touch of elegance
void printArray(double* array, int size) {
    printf("Array contents: ");
    for (int i = 0; i < size; i++) {
        printf("%f ", array[i]);
    }
    printf("\n");
}

// Function to perform a complex multiplication
void complexMultiply(double a, double b, double c, double d, double* real, double* imag) {
    *real = a * c - b * d;
    *imag = a * d + b * c;
}

// Function to perform the FFT
void fft(double* real, double* imag, int n) {
    if (n <= 1) return;

    // Splitting the array into even and odd parts
    double* evenReal = (double*)malloc(n / 2 * sizeof(double));
    double* evenImag = (double*)malloc(n / 2 * sizeof(double));
    double* oddReal = (double*)malloc(n / 2 * sizeof(double));
    double* oddImag = (double*)malloc(n / 2 * sizeof(double));

    for (int i = 0; i < n / 2; i++) {
        evenReal[i] = real[i * 2];
        evenImag[i] = imag[i * 2];
        oddReal[i] = real[i * 2 + 1];
        oddImag[i] = imag[i * 2 + 1];
    }

    // Recursively calling fft on even and odd parts
    fft(evenReal, evenImag, n / 2);
    fft(oddReal, oddImag, n / 2);

    // Combining the results
    for (int k = 0; k < n / 2; k++) {
        double tReal, tImag;
        double angle = -2 * M_PI * k / n;
        complexMultiply(cos(angle), sin(angle), oddReal[k], oddImag[k], &tReal, &tImag);
        real[k] = evenReal[k] + tReal;
        imag[k] = evenImag[k] + tImag;
        real[k + n / 2] = evenReal[k] - tReal;