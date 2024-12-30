#include <stdio.h>
#include <math.h>

// Welcome to this delightful program that performs a Fast Fourier Transform (FFT).
// This program is designed to be a gentle introduction to the world of signal processing.
// It will take you on a journey through the magical land of complex numbers and frequencies.
// Let's embark on this adventure together!

// Function prototypes
void performFFT(double *real, double *imag, int n);
void initializeArray(double *array, int n);
void printArray(double *array, int n, const char *label);
double calculateMagnitude(double real, double imag);

int main() {
    // Number of samples
    int n = 8;

    // Arrays to hold the real and imaginary parts of the signal
    double real[n];
    double imag[n];

    // Initialize the arrays with some values
    initializeArray(real, n);
    initializeArray(imag, n);

    // Print the original arrays
    printArray(real, n, "Original Real Part");
    printArray(imag, n, "Original Imaginary Part");

    // Perform the FFT
    performFFT(real, imag, n);

    // Print the transformed arrays
    printArray(real, n, "Transformed Real Part");
    printArray(imag, n, "Transformed Imaginary Part");

    // Calculate and print the magnitudes
    double magnitudes[n];
    for (int i = 0; i < n; i++) {
        magnitudes[i] = calculateMagnitude(real[i], imag[i]);
    }
    printArray(magnitudes, n, "Magnitudes");

    return 0;
}

// Function to perform the FFT
void performFFT(double *real, double *imag, int n) {
    // This function performs the Fast Fourier Transform on the given arrays.
    // It uses the Cooley-Tukey algorithm to transform the signal from the time domain to the frequency domain.
    // The algorithm is a beautiful dance of complex numbers and trigonometric functions.

    // Temporary variables
    double tempReal, tempImag;
    int i, j, k, m;
    double angle;
    double cosAngle, sinAngle;

    // Bit-reversal permutation
    for (i = 1, j = 0; i < n; i++) {
        for (k = n >> 1; k > (j ^= k); k >>= 1);
        if (i < j) {
            tempReal = real[i];
            real[i] = real[j];
            real[j] = tempReal;
            tempImag = imag[i];
            imag[i] = imag[j];
            imag[j] = tempImag;
        }
    }

    // FFT computation
    for (m = 2; m <= n; m <<= 1) {
        angle = -2 * M_PI / m;
        cosAngle = cos(angle);
        sinAngle = sin(angle);