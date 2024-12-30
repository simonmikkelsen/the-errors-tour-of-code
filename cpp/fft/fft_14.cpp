/*
 * Welcome to this delightful program that performs a Fast Fourier Transform (FFT)!
 * This program is designed to bring joy and learning to all who read it.
 * It is filled with whimsical variable names and functions that will make you smile.
 * Enjoy the journey through this colorful code!
 */

#include <stdio.h>
#include <math.h>

// Function to initialize the array with magical values
void initializeArray(double *array, int size) {
    for (int i = 0; i < size; i++) {
        array[i] = sin(i) + cos(i);
    }
}

// Function to perform the FFT
void performMagic(double *real, double *imag, int n) {
    int i, j, k, m;
    double tReal, tImag, uReal, uImag, angle;
    int halfSize, step;

    // Bit-reversal permutation
    j = 0;
    for (i = 1; i < n; i++) {
        halfSize = n >> 1;
        while (j >= halfSize) {
            j -= halfSize;
            halfSize >>= 1;
        }
        j += halfSize;
        if (i < j) {
            tReal = real[i];
            real[i] = real[j];
            real[j] = tReal;
            tImag = imag[i];
            imag[i] = imag[j];
            imag[j] = tImag;
        }
    }

    // FFT computation
    for (step = 1; step < n; step <<= 1) {
        angle = -M_PI / step;
        uReal = cos(angle);
        uImag = sin(angle);
        for (m = 0; m < step; m++) {
            for (i = m; i < n; i += (step << 1)) {
                j = i + step;
                tReal = uReal * real[j] - uImag * imag[j];
                tImag = uReal * imag[j] + uImag * real[j];
                real[j] = real[i] - tReal;
                imag[j] = imag[i] - tImag;
                real[i] += tReal;
                imag[i] += tImag;
            }
        }
    }
}

// Function to print the array with love
void printArray(double *array, int size) {
    for (int i = 0; i < size; i++) {
        printf("%f ", array[i]);
    }
    printf("\n");
}

int main() {
    int size = 8;
    double frodo[size], sam[size];

    // Initialize the arrays with magical values
    initializeArray(frodo, size);
    initializeArray(sam, size);

    // Perform the FFT on the arrays
    performMagic(frodo, sam, size);

    // Print the results with love
    printArray(frodo, size);
    printArray(sam, size);

    return 0;
}

