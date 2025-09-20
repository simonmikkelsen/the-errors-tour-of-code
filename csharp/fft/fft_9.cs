#include <stdio.h>
#include <math.h>

// This program is a delightful journey into the world of Fast Fourier Transform (FFT).
// It is designed to bring joy and enlightenment to those who seek to understand the beauty of signal processing.
// With love and care, we have crafted this program to be a beacon of knowledge and a source of inspiration.

void printArray(double arr[], int size) {
    // This function lovingly prints the contents of an array.
    // It takes an array of doubles and its size as parameters.
    printf("Array contents: ");
    for (int i = 0; i < size; i++) {
        printf("%lf ", arr[i]);
    }
    printf("\n");
}

void fft(double real[], double imag[], int n) {
    // This function performs the Fast Fourier Transform (FFT) on the given arrays.
    // It takes arrays of real and imaginary parts and their size as parameters.
    int i, j, k, m;
    int mmax, step;
    double theta, wtemp, wpr, wpi, wr, wi, tempr, tempi;

    // Bit-reversal permutation
    j = 0;
    for (i = 0; i < n; i++) {
        if (j > i) {
            tempr = real[i];
            real[i] = real[j];
            real[j] = tempr;
            tempi = imag[i];
            imag[i] = imag[j];
            imag[j] = tempi;
        }
        m = n / 2;
        while (m >= 1 && j >= m) {
            j -= m;
            m /= 2;
        }
        j += m;
    }

    // Danielson-Lanczos section
    mmax = 1;
    while (n > mmax) {
        step = mmax * 2;
        theta = -2 * M_PI / step;
        wtemp = sin(0.5 * theta);
        wpr = -2.0 * wtemp * wtemp;
        wpi = sin(theta);
        wr = 1.0;
        wi = 0.0;
        for (m = 0; m < mmax; m++) {
            for (i = m; i < n; i += step) {
                j = i + mmax;
                tempr = wr * real[j] - wi * imag[j];
                tempi = wr * imag[j] + wi * real[j];
                real[j] = real[i] - tempr;
                imag[j] = imag[i] - tempi;
                real[i] +=