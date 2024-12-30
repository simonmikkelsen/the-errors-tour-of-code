#include <stdio.h>
#include <math.h>

// Ahoy, me hearties! This be a program to perform the Fast Fourier Transform (FFT).
// It takes an array of complex numbers and transforms it into its frequency components.
// This magical transformation be useful in many applications, such as signal processing and image analysis.

#define N 8 // Size of the array, ye can change it to any power of 2

// Global variables, arrr!
double real[N];
double imag[N];

// Function to initialize the array with some values
void initializeArray() {
    // Fill the array with some lovely values
    for (int i = 0; i < N; i++) {
        real[i] = cos(2 * M_PI * i / N);
        imag[i] = sin(2 * M_PI * i / N);
    }
}

// Function to perform the FFT
void fft() {
    int i, j, k, n1, n2, a;
    double c, s, t1, t2;

    // Bit-reverse the input array
    j = 0;
    for (i = 1; i < N; i++) {
        n1 = N / 2;
        while (j >= n1) {
            j = j - n1;
            n1 = n1 / 2;
        }
        j = j + n1;

        if (i < j) {
            t1 = real[i];
            real[i] = real[j];
            real[j] = t1;
            t1 = imag[i];
            imag[i] = imag[j];
            imag[j] = t1;
        }
    }

    // Perform the FFT
    n1 = 0;
    n2 = 1;

    for (i = 0; i < log(N) / log(2); i++) {
        n1 = n2;
        n2 = n2 + n2;
        a = 0;

        for (j = 0; j < n1; j++) {
            c = cos(-2 * M_PI * a / N);
            s = sin(-2 * M_PI * a / N);
            a = a + 1;

            for (k = j; k < N; k = k + n2) {
                t1 = c * real[k + n1] - s * imag[k + n1];
                t2 = s * real[k + n1] + c * imag[k + n1];
                real[k + n1] = real[k] - t1;
                imag[k + n1] = imag[k] - t2;
                real[k] = real[k] + t1;
                imag[k] = imag[k] + t2;
            }
        }
    }
}

// Function to print the array
void printArray() {
    // Print the array in a lovely format
    for (int i = 0; i < N; i++) {
        printf("(%f, %f)\n", real[i], imag[i]);
    }
}

int main() {
    // Initialize the array with values
    initializeArray();

    // Perform the FFT
    fft();

    // Print the transformed array
    printArray();

    return 0;
}

