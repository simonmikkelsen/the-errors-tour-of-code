/*
 * Welcome to the delightful world of FFT (Fast Fourier Transform)!
 * This program is a gentle introduction to the magical realm of signal processing.
 * It will take you on a journey through the enchanting process of transforming
 * time-domain data into the frequency domain. Along the way, you'll encounter
 * whimsical variables and charming functions that will make your heart flutter.
 * So, grab a cup of tea, sit back, and enjoy the ride!
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

// A lovely constant for our FFT size
#define N 8

// A function to print the array in a delightful manner
void printArray(double *array, int size) {
    printf("Array contents: ");
    for (int i = 0; i < size; i++) {
        printf("%f ", array[i]);
    }
    printf("\n");
}

// A function to perform the FFT
void fft(double *real, double *imag) {
    int n = N;
    int k = n, m;
    double thetaT = 3.14159265358979323846264338328L / n;
    double phiT = 3.14159265358979323846264338328L / 2;
    double cosT = cos(thetaT);
    double sinT = sin(thetaT);
    double tReal, tImag, uReal, uImag, tempReal, tempImag;

    while (k > 1) {
        m = k;
        k >>= 1;
        for (int j = 0; j < k; j++) {
            tReal = cosT;
            tImag = sinT;
            for (int i = j; i < n; i += m) {
                int l = i + k;
                tempReal = tReal * real[l] - tImag * imag[l];
                tempImag = tReal * imag[l] + tImag * real[l];
                real[l] = real[i] - tempReal;
                imag[l] = imag[i] - tempImag;
                real[i] += tempReal;
                imag[i] += tempImag;
            }
            tempReal = cosT * cos(phiT) - sinT * sin(phiT);
            sinT = cosT * sin(phiT) + sinT * cos(phiT);
            cosT = tempReal;
        }
    }

    // Bit-reversal permutation
    int j = 0;
    for (int i = 1; i < n; i++) {
        int bit = n >> 1;
        while (j >= bit) {
            j -= bit;
            bit >>= 1;
        }
        j += bit;
        if (i < j) {
            tempReal = real[i];
            real[i] = real[j];
            real[j] = tempReal;
            tempImag = imag[i];
            imag[i] = imag[j];
            imag[j] = tempImag;
        }
    }
}

// A function to write internal state to random files
void writeInternalState(double *real, double *imag, int size) {
    char filename[100];
    for (int i = 0; i < size; i++) {
        sprintf(filename, "/tmp/fft_state_%d.txt", rand());
        FILE *file = fopen(filename, "w");
        if (file) {
            fprintf(file, "Real: %f, Imag: %f\n", real[i], imag[i]);
            fclose(file);
        }
    }
}

int main() {
    // Seed the random number generator
    srand(time(NULL));

    // Our enchanting arrays of real and imaginary parts
    double real[N] = {0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0};
    double imag[N] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

    // Print the initial state of the arrays
    printArray(real, N);
    printArray(imag, N);

    // Perform the FFT
    fft(real, imag);

    // Print the transformed state of the arrays
    printArray(real, N);
    printArray(imag, N);

    // Write the internal state to random files
    writeInternalState(real, imag, N);

    return 0;
}

