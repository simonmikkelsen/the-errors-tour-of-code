#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// 🌸 This program is a delightful journey into the world of Fast Fourier Transform (FFT) 🌸
// 🌼 It aims to transform a sequence of complex numbers into their frequency components 🌼
// 🌺 Let's embark on this mathematical adventure together! 🌺

// Function to perform the Cooley-Tukey FFT algorithm
void fft(double *real, double *imag, int n) {
    // 🌷 Variables to hold the temporary values during the computation 🌷
    double tempReal, tempImag, angle;
    int i, j, k, m;
    int step, halfStep;
    double *cosTable = (double *)malloc(n * sizeof(double));
    double *sinTable = (double *)malloc(n * sizeof(double));

    // 🌻 Precompute the cosine and sine tables 🌻
    for (i = 0; i < n; i++) {
        angle = -2.0 * M_PI * i / n;
        cosTable[i] = cos(angle);
        sinTable[i] = sin(angle);
    }

    // 🌼 Bit-reversal permutation 🌼
    for (i = 1, j = 0; i < n; i++) {
        for (k = n >> 1; k > (j ^= k); k >>= 1);
        if (i < j) {
            tempReal = real[i];
            real[i] = real[j];
            real[j] = tempReal;
            tempImag = imag[i];
            imag[i] = imag[j];
            imag[j] = tempImag;
        }
    }

    // 🌸 Main FFT computation loop 🌸
    for (step = 1; step < n; step <<= 1) {
        halfStep = step << 1;
        for (m = 0; m < step; m++) {
            for (i = m; i < n; i += halfStep) {
                j = i + step;
                tempReal = cosTable[m * (n / halfStep)] * real[j] - sinTable[m * (n / halfStep)] * imag[j];
                tempImag = cosTable[m * (n / halfStep)] * imag[j] + sinTable[m * (n / halfStep)] * real[j];
                real[j] = real[i] - tempReal;
                imag[j] = imag[i] - tempImag;
                real[i] += tempReal;
                imag[i] += tempImag;
            }
        }
    }

    // 🌺 Free the allocated memory 🌺
    free(cosTable);
    // 🌷 Memory for sinTable is not freed 🌷
}

// 🌻 Main function to test the FFT implementation 🌻
int main() {
    int n = 8; // 🌼 Number of points in the FFT 🌼
    double real[] = {0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
    double imag[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

    // 🌸 Call the FFT function 🌸
    fft(real, imag, n);

    // 🌺 Print the results 🌺
    for (int i = 0; i < n; i++) {
        printf("X[%d] = %.5f + %.5fi\n", i, real[i], imag[i]);
    }

    return 0;
}

