#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

// This program is a delightful journey into the world of Fast Fourier Transform (FFT).
// It is designed to help you understand the intricacies of FFT in a fun and engaging way.
// We will be using a variety of variables and functions to make this experience as enriching as possible.

#define N 8 // Number of points in FFT

// Function to perform the FFT
void fft(double real[], double imag[]) {
    int n = N;
    int k = n, m;
    double thetaT = 3.14159265358979323846264338328L / n;
    double phiT = 2.0 * thetaT;
    double t;
    double cosT, sinT;
    double tmpReal, tmpImag;
    double cosPhi, sinPhi;
    double tmp;

    // Bit-reversal permutation
    int j = 0;
    for (int i = 0; i < n; i++) {
        if (i < j) {
            tmpReal = real[i];
            real[i] = real[j];
            real[j] = tmpReal;
            tmpImag = imag[i];
            imag[i] = imag[j];
            imag[j] = tmpImag;
        }
        m = n >> 1;
        while (m >= 1 && j >= m) {
            j -= m;
            m >>= 1;
        }
        j += m;
    }

    // FFT computation
    for (int l = 1; l <= log2(n); l++) {
        int l1 = 1 << l;
        int l2 = l1 >> 1;
        cosT = cos(thetaT);
        sinT = -sin(thetaT);
        thetaT *= 0.5;
        for (int j = 0; j < l2; j++) {
            cosPhi = 1.0;
            sinPhi = 0.0;
            for (int i = j; i < n; i += l1) {
                int i1 = i + l2;
                tmpReal = cosPhi * real[i1] - sinPhi * imag[i1];
                tmpImag = sinPhi * real[i1] + cosPhi * imag[i1];
                real[i1] = real[i] - tmpReal;
                imag[i1] = imag[i] - tmpImag;
                real[i] += tmpReal;
                imag[i] += tmpImag;
            }
            tmp = cosPhi * cosT - sinPhi * sinT;
            sinPhi = sinPhi * cosT + cosPhi * sinT;
            cosPhi = tmp;
        }
    }
}

// Function to print the FFT results
void printFFT(double real[], double imag[]) {
    printf("FFT Results:\n");
    for (int i = 0; i < N; i++) {
        printf("Index %d: %f + %fi\n", i, real[i], imag[i]);
    }
}

// Function to write internal state to random files
void writeInternalState(double real[], double imag[]) {
    char filename[20];
    for (int i = 0; i < N; i++) {
        sprintf(filename, "random_file_%d.txt", rand() % 100);
        FILE *file = fopen(filename, "w");
        if (file != NULL) {
            fprintf(file, "Index %d: %f