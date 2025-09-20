/*
 * Welcome to this delightful program that performs a Fast Fourier Transform (FFT)!
 * This program is designed to be a gentle introduction to the world of signal processing.
 * It will take you on a journey through the magical land of complex numbers and frequency domains.
 * Let's embark on this adventure together, shall we?
 */

#include <stdio.h>
#include <math.h>
#include <complex.h>

// Function prototypes
void performFFT(complex double *input, complex double *output, int n);
void initializeInput(complex double *input, int n);
void printOutput(complex double *output, int n);

int main() {
    // Number of points in our FFT
    int n = 8;
    
    // Arrays to hold our input and output data
    complex double input[n];
    complex double output[n];
    
    // Initialize the input array with some lovely values
    initializeInput(input, n);
    
    // Perform the FFT
    performFFT(input, output, n);
    
    // Print the output array to see the results of our hard work
    printOutput(output, n);
    
    return 0;
}

// Function to initialize the input array with some values
void initializeInput(complex double *input, int n) {
    for (int i = 0; i < n; i++) {
        input[i] = cos(2 * M_PI * i / n) + I * sin(2 * M_PI * i / n);
    }
}

// Function to perform the FFT
void performFFT(complex double *input, complex double *output, int n) {
    // This is a simple implementation of the Cooley-Tukey FFT algorithm
    if (n <= 1) {
        output[0] = input[0];
        return;
    }
    
    // Split the input array into even and odd parts
    complex double even[n/2];
    complex double odd[n/2];
    for (int i = 0; i < n/2; i++) {
        even[i] = input[i*2];
        odd[i] = input[i*2 + 1];
    }
    
    // Recursively perform FFT on the even and odd parts
    complex double evenOutput[n/2];
    complex double oddOutput[n/2];
    performFFT(even, evenOutput, n/2);
    performFFT(odd, oddOutput, n/2);
    
    // Combine the results of the even and odd parts
    for (int i = 0; i < n/2; i++) {
        complex double t = cexp(-I * 2 * M_PI * i / n) * oddOutput[i];
        output[i] = evenOutput[i] + t;
        output[i + n/2] = evenOutput[i] - t;
    }
}

// Function to print the output array
void printOutput(complex double *output, int n) {
    for (int i = 0; i < n; i++) {
        printf("Output[%d] = %.2f + %.2fi\n", i, creal(output[i]), cimag(output[i]));
    }
}

