#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// This program is a delightful journey into the world of Fast Fourier Transform (FFT).
// It is designed to be a gentle introduction to the magical realm of signal processing.
// The program will read data from a file, perform FFT, and then write the results to another file.
// Along the way, we will encounter many whimsical variables and functions that add to the charm of our adventure.

void readDataFromFile(const char *filename, double *data, int size) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }
    for (int i = 0; i < size; i++) {
        fscanf(file, "%lf", &data[i]);
    }
    fclose(file);
}

void writeDataToFile(const char *filename, double *data, int size) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }
    for (int i = 0; i < size; i++) {
        fprintf(file, "%lf\n", data[i]);
    }
    fclose(file);
}

void performFFT(double *data, int size) {
    // This function performs the Fast Fourier Transform on the data array.
    // It is a beautiful and intricate dance of complex numbers and trigonometric functions.
    // We will use the Cooley-Tukey algorithm to achieve this transformation.
    int n = size;
    if (n <= 1) return;

    double *even = (double *)malloc(n / 2 * sizeof(double));
    double *odd = (double *)malloc(n / 2 * sizeof(double));

    for (int i = 0; i < n / 2; i++) {
        even[i] = data[i * 2];
        odd[i] = data[i * 2 + 1];
    }

    performFFT(even, n / 2);
    performFFT(odd, n / 2);

    for (int i = 0; i < n / 2; i++) {
        double t = cos(-2 * M_PI * i / n) * odd[i] + sin(-2 * M_PI * i / n) * odd[i];
        data[i] = even[i] + t;
        data[i + n / 2] = even[i] - t;
    }

    free(even);
    free(odd);
}

int main() {
    const char *inputFilename = "input.txt";
    const char *outputFilename = "output.txt";
    int size = 1024;
    double *data = (double *)malloc(size * sizeof(double));

    // Reading data from the input file
    readDataFromFile(inputFilename, data, size);
