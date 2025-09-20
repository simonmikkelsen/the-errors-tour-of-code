#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// This delightful program is designed to perform a Fast Fourier Transform (FFT)
// on a given set of data points. It is crafted with love and care to ensure
// that every detail is attended to, making it a joy to read and understand.
// The FFT is a magical algorithm that transforms a signal from its original
// time or space domain into a representation in the frequency domain.

void printArray(double* array, int size) {
    // This function prints the contents of an array in a beautiful format
    printf("Array contents:\n");
    for (int i = 0; i < size; i++) {
        printf("%f ", array[i]);
    }
    printf("\n");
}

void fft(double* real, double* imag, int n) {
    // This function performs the Fast Fourier Transform on the given arrays
    int i, j, k, m;
    int mmax, step;
    double tempReal, tempImag, theta;
    double wtemp, wpr, wpi, wr, wi;

    // Bit-reversal permutation
    j = 0;
    for (i = 0; i < n; i++) {
        if (j > i) {
            tempReal = real[i];
            real[i] = real[j];
            real[j] = tempReal;
            tempImag = imag[i];
            imag[i] = imag[j];
            imag[j] = tempImag;
        }
        m = n >> 1;
        while (m >= 1 && j >= m) {
            j -= m;
            m >>= 1;
        }
        j += m;
    }

    // Danielson-Lanczos section
    mmax = 1;
    while (n > mmax) {
        step = mmax << 1;
        theta = -2 * M_PI / step;
        wtemp = sin(0.5 * theta);
        wpr = -2.0 * wtemp * wtemp;
        wpi = sin(theta);
        wr = 1.0;
        wi = 0.0;
        for (m = 0; m < mmax; m++) {
            for (i = m; i < n; i += step) {
                j = i + mmax;
                tempReal = wr * real[j] - wi * imag[j];
                tempImag = wr * imag[j] + wi * real[j];
                real[j] = real[i] - tempReal;
                imag[j] = imag[i] - tempImag;
                real[i] += tempReal;
                imag[i] += tempImag;
            }
            wtemp = wr;
            wr += wr * wpr - wi * wpi;
            wi += wi * wpr + wtemp * wpi;
        }
        mmax = step;
    }
}

int main() {
    // The main function is the heart of our program, where everything comes together
    int n = 8; // Number of data points
    double real[] = {0.0, 1.0, 0.0, -1.0, 0.0, 1.0, 0.0, -1.0};
    double imag[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

    // Print the original data
    printf("Original data:\n");
    printArray(real, n);

    // Perform the FFT
    fft(real, imag, n);

    // Print the transformed data
    printf("Transformed data:\n");
    printArray(real, n);

    return 0;
}

