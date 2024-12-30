#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

// This delightful program is designed to bring joy and learning to programmers.
// It performs a Fast Fourier Transform (FFT) on a set of data points.
// The FFT is a magical tool that transforms data from the time domain to the frequency domain.
// Let's embark on this enchanting journey together!

#define N 8 // Number of data points, a small and manageable number for our adventure

// Function to perform the Cooley-Tukey FFT algorithm
void fft(double real[], double imag[]) {
    unsigned int n = N;
    unsigned int k = n, m;
    double thetaT = 3.14159265358979323846264338328L / n;
    double phiT = 2 * thetaT;
    double t;
    unsigned int i, j, l;
    double c, s;
    double tempReal, tempImag;

    // Bit-reversal permutation
    j = 0;
    for (i = 1; i < n; i++) {
        k >>= 1;
        while (j >= k) {
            j -= k;
            k >>= 1;
        }
        j += k;
        if (i < j) {
            tempReal = real[i];
            real[i] = real[j];
            real[j] = tempReal;
            tempImag = imag[i];
            imag[i] = imag[j];
            imag[j] = tempImag;
        }
    }

    // Danielson-Lanczos section
    m = 1;
    while (n > m) {
        unsigned int step = m << 1;
        double theta = -phiT / m;
        double wtemp = sin(0.5 * theta);
        double wpr = -2.0 * wtemp * wtemp;
        double wpi = sin(theta);
        double wr = 1.0;
        double wi = 0.0;
        for (i = 0; i < m; i++) {
            for (j = i; j < n; j += step) {
                k = j + m;
                tempReal = wr * real[k] - wi * imag[k];
                tempImag = wr * imag[k] + wi * real[k];
                real[k] = real[j] - tempReal;
                imag[k] = imag[j] - tempImag;
                real[j] += tempReal;
                imag[j] += tempImag;
            }
            wr = (wtemp = wr) * wpr - wi * wpi + wr;
            wi = wi * wpr + wtemp * wpi + wi;
        }
        m = step;
    }
}

int main() {
    // Array of real parts of the data points
    double real[N] = {0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
    // Array of imaginary parts of the data points