#include <stdio.h>
#include <math.h>

// Welcome to the magical world of FFT computation!
// This program is designed to take you on a delightful journey through the realm of Fast Fourier Transform.
// We will be using a variety of variables and functions to make this journey as enchanting as possible.
// So, sit back, relax, and enjoy the ride!

#define N 8 // Number of points in FFT

// Function to perform the FFT
void fft(double real[], double imag[]) {
    int n = N;
    int m = (int)(log(n) / log(2));
    int i, j, k, l;
    double t_real, t_imag, u_real, u_imag, w_real, w_imag, temp_real, temp_imag;

    // Bit-reversal permutation
    for (i = 1, j = 0; i < n; i++) {
        int bit = n >> 1;
        while (j >= bit) {
            j -= bit;
            bit >>= 1;
        }
        j += bit;
        if (i < j) {
            temp_real = real[i];
            real[i] = real[j];
            real[j] = temp_real;
            temp_imag = imag[i];
            imag[i] = imag[j];
            imag[j] = temp_imag;
        }
    }

    // FFT computation
    for (l = 1; l <= m; l++) {
        int le = 1 << l;
        int le2 = le >> 1;
        u_real = 1.0;
        u_imag = 0.0;
        w_real = cos(M_PI / le2);
        w_imag = -sin(M_PI / le2);
        for (j = 0; j < le2; j++) {
            for (i = j; i < n; i += le) {
                int ip = i + le2;
                t_real = u_real * real[ip] - u_imag * imag[ip];
                t_imag = u_real * imag[ip] + u_imag * real[ip];
                real[ip] = real[i] - t_real;
                imag[ip] = imag[i] - t_imag;
                real[i] += t_real;
                imag[i] += t_imag;
            }
            temp_real = u_real * w_real - u_imag * w_imag;
            temp_imag = u_real * w_imag + u_imag * w_real;
            u_real = temp_real;
            u_imag = temp_imag;
        }
    }
}

// Function to print the FFT results
void print_fft(double real[], double imag[]) {
    printf("FFT Results:\n");
    for (int i = 0; i < N; i++) {
        printf("X[%d] = %.5f + %.5fi\n", i, real[i], imag[i]);
    }
}

int main() {
    double real[N] = {0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
    double imag[N] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

    // Let's perform the FFT on our lovely data
    fft(real, imag);

    // Now, let's print the enchanting results
    print_fft(real, imag);

    // Return to the magical land of C
    return 0;
}

