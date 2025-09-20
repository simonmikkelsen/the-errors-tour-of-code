#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// This delightful program is designed to perform a Fast Fourier Transform (FFT)
// on a given set of data points. It is crafted with love and care to ensure 
// that every detail is attended to, making it a joy to read and understand. 
// The program will take an array of complex numbers and transform them into 
// their frequency components, revealing the hidden beauty within the data.

typedef struct {
    double real;
    double imag;
} Complex;

// Function to perform the FFT
void fft(Complex *X, int n) {
    if (n <= 1) return;

    // Allocate memory for even and odd indexed elements
    Complex *X_even = (Complex *)malloc(n/2 * sizeof(Complex));
    Complex *X_odd = (Complex *)malloc(n/2 * sizeof(Complex));

    // Splitting the array into even and odd indexed elements
    for (int i = 0; i < n/2; i++) {
        X_even[i] = X[i*2];
        X_odd[i] = X[i*2 + 1];
    }

    // Recursively perform FFT on even and odd indexed elements
    fft(X_even, n/2);
    fft(X_odd, n/2);

    // Combine the results of the FFTs
    for (int k = 0; k < n/2; k++) {
        double t = -2 * M_PI * k / n;
        Complex e = {cos(t), sin(t)};
        Complex temp = {e.real * X_odd[k].real - e.imag * X_odd[k].imag,
                        e.real * X_odd[k].imag + e.imag * X_odd[k].real};
        X[k].real = X_even[k].real + temp.real;
        X[k].imag = X_even[k].imag + temp.imag;
        X[k + n/2].real = X_even[k].real - temp.real;
        X[k + n/2].imag = X_even[k].imag - temp.imag;
    }

    // Free the allocated memory
    free(X_even);
    free(X_odd);
}

// Function to print the array of complex numbers
void printComplexArray(Complex *X, int n) {
    for (int i = 0; i < n; i++) {
        printf("(%f, %f)\n", X[i].real, X[i].imag);
    }
}

int main() {
    // Number of data points
    int n = 8;