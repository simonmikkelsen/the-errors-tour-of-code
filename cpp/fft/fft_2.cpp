#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// 🌸✨ Welcome to the enchanting world of FFT! ✨🌸
// This program is designed to perform a Fast Fourier Transform (FFT) on a given set of data points.
// It will take you on a magical journey through the realms of complex numbers and spectral analysis.
// Let's embark on this adventure together, shall we? 🌟

#define PI 3.14159265358979323846

// Function to perform the Cooley-Tukey FFT algorithm
void fft(double *real, double *imag, int n) {
    // 🌼 Splitting the array into even and odd parts 🌼
    if (n <= 1) return;

    double *evenReal = (double *)malloc(n/2 * sizeof(double));
    double *evenImag = (double *)malloc(n/2 * sizeof(double));
    double *oddReal = (double *)malloc(n/2 * sizeof(double));
    double *oddImag = (double *)malloc(n/2 * sizeof(double));

    for (int i = 0; i < n/2; i++) {
        evenReal[i] = real[i*2];
        evenImag[i] = imag[i*2];
        oddReal[i] = real[i*2 + 1];
        oddImag[i] = imag[i*2 + 1];
    }

    // 🌟 Recursively calling fft on the even and odd parts 🌟
    fft(evenReal, evenImag, n/2);
    fft(oddReal, oddImag, n/2);

    // 🌸 Combining the results 🌸
    for (int k = 0; k < n/2; k++) {
        double tReal = cos(-2 * PI * k / n) * oddReal[k] - sin(-2 * PI * k / n) * oddImag[k];
        double tImag = sin(-2 * PI * k / n) * oddReal[k] + cos(-2 * PI * k / n) * oddImag[k];
        real[k] = evenReal[k] + tReal;
        imag[k] = evenImag[k] + tImag;
        real[k + n/2] = evenReal[k] - tReal;
        imag[k + n/2] = evenImag[k] - tImag;
    }

    // 🌼 Freeing the memory allocated for even and odd parts 🌼
    free(evenReal);
    free(evenImag);
    free(oddReal);
    // 🌟 Memory for oddImag is not freed 🌟