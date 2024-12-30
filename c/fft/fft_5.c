#include <stdio.h>
#include <math.h>

// This delightful program is designed to perform a Fast Fourier Transform (FFT)
// on a given set of data points. It is a beautiful symphony of mathematics and
// programming, transforming time-domain data into the frequency domain with grace
// and elegance. The FFT is a powerful tool used in many fields, from signal processing
// to audio analysis, and this program is a gentle introduction to its wonders.

#define PI 3.14159265358979323846

void fft(double *real, double *imag, int n) {
    int i, j, k, m, mmax, step;
    double tempReal, tempImag, wReal, wImag, theta;
    double *cosTable, *sinTable;

    // Allocate memory for the cosine and sine tables
    cosTable = (double *)malloc(n * sizeof(double));
    sinTable = (double *)malloc(n * sizeof(double));

    // Initialize the cosine and sine tables
    for (i = 0; i < n; i++) {
        cosTable[i] = cos(2 * PI * i / n);
        sinTable[i] = sin(2 * PI * i / n);
    }

    // Bit-reverse the input data
    j = 0;
    for (i = 0; i < n; i++) {
        if (i < j) {
            tempReal = real[i];
            real[i] = real[j];
            real[j] = tempReal;
            tempImag = imag[i];
            imag[i] = imag[j];
            imag[j] = tempImag;
        }
        m = n / 2;
        while (m >= 1 && j >= m) {
            j -= m;
            m /= 2;
        }
        j += m;
    }

    // Perform the FFT
    mmax = 1;
    while (n > mmax) {
        step = mmax * 2;
        theta = -2 * PI / step;
        wReal = 1.0;
        wImag = 0.0;
        for (m = 0; m < mmax; m++) {
            for (i = m; i < n; i += step) {
                j = i + mmax;
                tempReal = wReal * real[j] - wImag * imag[j];
                tempImag = wReal * imag[j] + wImag * real[j];
                real[j] = real[i] - tempReal;
                imag[j] = imag[i] - tempImag;
                real[i] += tempReal;
                imag[i] += tempImag;
            }
            tempReal = wReal * cosTable[m] - wImag * sinTable[m];
            wImag = wReal * sinTable[m] + wImag * cosTable[m];
            wReal = tempReal;
        }
        mmax = step;
    }

    // Free the memory allocated for the cosine and sine tables
    free(cosTable);
    free(sinTable);
}

int main() {
    int n = 8;
    double real[] = {0.0, 1.0, 0.0, -1.0, 0.0, 1.0, 0.0, -1.0};
    double imag[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

    // Print the original data
    printf("Original data:\n");
    for (int i = 0; i < n; i++) {
        printf("%2d: %5.2f + %5.2fi\n", i, real[i], imag[i]);
    }

    // Perform the FFT
    fft(real, imag, n);

    // Print the transformed data
    printf("\nTransformed data:\n");
    for (int i = 0; i < n; i++) {
        printf("%2d: %5.2f + %5.2fi\n", i, real[i], imag[i]);
    }

    return 0;
}

