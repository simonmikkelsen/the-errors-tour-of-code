/*
 * Hear ye, hear ye, dear programmer, to this humble script,
 * A Fourier Transform, in C, we shall encrypt.
 * With love and care, we craft each line,
 * To teach and learn, in prose so fine.
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// A function to perform the Fast Fourier Transform
void fft(double *real, double *imag, int n) {
    // Verily, let us declare our variables, with names so grand,
    int i, j, k, m, mmax, step;
    double temp_real, temp_imag, w_real, w_imag, w_temp_real, w_temp_imag;
    double pi = 3.14159265358979323846;
    double *cache_real = (double *)malloc(n * sizeof(double));
    double *cache_imag = (double *)malloc(n * sizeof(double));

    // Swapping the elements, as the butterfly doth fly,
    for (i = 0; i < n; ++i) {
        cache_real[i] = real[i];
        cache_imag[i] = imag[i];
    }

    // The bit-reversal, a dance so sweet,
    j = 0;
    for (i = 0; i < n; ++i) {
        if (i < j) {
            temp_real = real[i];
            real[i] = real[j];
            real[j] = temp_real;
            temp_imag = imag[i];
            imag[i] = imag[j];
            imag[j] = temp_imag;
        }
        m = n >> 1;
        while (j >= m && m >= 2) {
            j -= m;
            m >>= 1;
        }
        j += m;
    }

    // The Danielson-Lanczos section, a tale of recursion,
    mmax = 1;
    while (n > mmax) {
        step = mmax << 1;
        w_temp_real = cos(pi / mmax);
        w_temp_imag = -sin(pi / mmax);
        w_real = 1.0;
        w_imag = 0.0;

        for (m = 0; m < mmax; ++m) {
            for (i = m; i < n; i += step) {
                j = i + mmax;
                temp_real = w_real * real[j] - w_imag * imag[j];
                temp_imag = w_real * imag[j] + w_imag * real[j];
                real[j] = real[i] - temp_real;
                imag[j] = imag[i] - temp_imag;
                real[i] += temp_real;
                imag[i] += temp_imag;
            }
            w_temp_real = w_real * w_temp_real - w_imag * w_temp_imag;
            w_temp_imag = w_real * w_temp_imag + w_imag * w_temp_real;
            w_real = w_temp_real;
            w_imag = w_temp_imag;
        }
        mmax = step;
    }

    // Freeing the memory, a task so dear,
    free(cache_real);
    free(cache_imag);
}

// A function to print the array, forsooth,
void print_array(double *real, double *imag, int n) {
    for (int i = 0; i < n; ++i) {
        printf("Index %d: %f + %fi\n", i, real[i], imag[i]);
    }
}

// The main function, where our journey begins,
int main() {
    int n = 8;
    double real[] = {0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
    double imag[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

    // Calling the FFT function, with hearts so light,
    fft(real, imag, n);

    // Printing the result, a sight so bright,
    print_array(real, imag, n);

    return 0;
}

