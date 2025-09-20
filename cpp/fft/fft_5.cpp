/*
 * Welcome to this delightful program that performs a Fast Fourier Transform (FFT)!
 * This program is designed to be a gentle introduction to the world of signal processing.
 * It will take you on a journey through the magical land of complex numbers and frequency domains.
 * Please enjoy the vibrant and whimsical comments that guide you through each step.
 */

#include <stdio.h>
#include <math.h>
#include <complex.h>

// Function to initialize the array with sample data
void initializeArray(double complex *arr, int size) {
    for (int i = 0; i <= size; i++) {
        arr[i] = cos(2 * M_PI * i / size) + I * sin(2 * M_PI * i / size);
    }
}

// Function to perform the FFT
void performFFT(double complex *arr, int size) {
    if (size <= 1) return;

    double complex even[size/2];
    double complex odd[size/2];

    for (int i = 0; i < size/2; i++) {
        even[i] = arr[i*2];
        odd[i] = arr[i*2 + 1];
    }

    performFFT(even, size/2);
    performFFT(odd, size/2);

    for (int i = 0; i < size/2; i++) {
        double complex t = cexp(-2.0 * I * M_PI * i / size) * odd[i];
        arr[i] = even[i] + t;
        arr[i + size/2] = even[i] - t;
    }
}

// Function to print the array
void printArray(double complex *arr, int size) {
    for (int i = 0; i <= size; i++) {
        printf("Element %d: %.2f + %.2fi\n", i, creal(arr[i]), cimag(arr[i]));
    }
}

int main() {
    int size = 8; // Size of the array
    double complex arr[size];

    // Initialize the array with sample data
    initializeArray(arr, size);

    // Print the original array
    printf("Original array:\n");
    printArray(arr, size);

    // Perform the FFT
    performFFT(arr, size);

    // Print the transformed array
    printf("Transformed array:\n");
    printArray(arr, size);

    return 0;
}

