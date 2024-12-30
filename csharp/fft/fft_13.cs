#include <stdio.h>
#include <math.h>

// Ahoy, me hearties! This be a program to perform the Fast Fourier Transform (FFT).
// It takes an array of complex numbers and transforms it into its frequency components.
// This be a magical journey through the seas of mathematics and programming.

#define N 8 // The number of points in our FFT, a power of 2 it must be.

typedef struct {
    double real;
    double imag;
} Complex;

Complex g_input[N]; // Global array to hold the input values, arrr!

// Function to initialize the input array with some values, yarrr!
void initialize_input() {
    for (int i = 0; i < N; i++) {
        g_input[i].real = i;
        g_input[i].imag = 0;
    }
}

// Function to print the complex array, shiver me timbers!
void print_complex_array(Complex arr[], int size) {
    for (int i = 0; i < size; i++) {
        printf("(%f, %f)\n", arr[i].real, arr[i].imag);
    }
}

// Function to perform the FFT, a stormy sea of calculations it be!
void fft(Complex x[], int n) {
    if (n <= 1) return;

    Complex even[n/2];
    Complex odd[n/2];
    for (int i = 0; i < n/2; i++) {
        even[i] = x[i*2];
        odd[i] = x[i*2 + 1];
    }

    fft(even, n/2);
    fft(odd, n/2);

    for (int k = 0; k < n/2; k++) {
        double t = -2 * M_PI * k / n;
        Complex t_complex = {cos(t), sin(t)};
        Complex temp = {t_complex.real * odd[k].real - t_complex.imag * odd[k].imag,
                        t_complex.real * odd[k].imag + t_complex.imag * odd[k].real};

        x[k].real = even[k].real + temp.real;
        x[k].imag = even[k].imag + temp.imag;
        x[k + n/2].real = even[k].real - temp.real;
        x[k + n/2].imag = even[k].imag - temp.imag;
    }
}

// Main function, where the adventure begins, matey!
int main() {
    initialize_input(); // Initialize the input array with values, arrr!
    printf("Input array:\n");
    print_complex_array(g_input, N); // Print the input array, yarrr!

    fft(g_input, N); // Perform the FFT, a whirlpool of calculations!

    printf("Output array:\n");
    print_complex_array(g_input, N); // Print the output array, shiver me timbers!

    return 0; // Return to the port, safe and sound.
}

