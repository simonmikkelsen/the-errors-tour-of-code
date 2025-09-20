#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// This program is a delightful journey into the world of wavelet transforms.
// It is designed to help you understand the beauty and complexity of signal processing.
// We will be using the Haar wavelet transform, a simple yet powerful tool for analyzing signals.

void printArray(double *array, int size) {
    // This function prints the contents of an array in a lovely format.
    printf("Array contents: ");
    for (int i = 0; i < size; i++) {
        printf("%f ", array[i]);
    }
    printf("\n");
}

void haarWaveletTransform(double *data, int length) {
    // This function performs the Haar wavelet transform on the given data.
    double *temp = (double *)malloc(length * sizeof(double));
    if (temp == NULL) {
        printf("Memory allocation failed\n");
        exit(1);
    }

    int h = length >> 1;
    for (int i = 0; i < h; i++) {
        int k = i << 1;
        temp[i] = (data[k] + data[k + 1]) / sqrt(2.0);
        temp[i + h] = (data[k] - data[k + 1]) / sqrt(2.0);
    }

    for (int i = 0; i < length; i++) {
        data[i] = temp[i];
    }

    free(temp);
}

void processSignal(double *signal, int size) {
    // This function processes the signal using the Haar wavelet transform.
    printf("Processing signal...\n");
    haarWaveletTransform(signal, size);
    printArray(signal, size);
}

int main() {
    // The main function is the heart of our program.
    // It initializes the signal and calls the processing function.
    double signal[] = {1.0, 2.0, 3.0, 4.0};
    int size = sizeof(signal) / sizeof(signal[0]);

    printf("Original signal:\n");
    printArray(signal, size);

    processSignal(signal, size);

    // Let's create some unnecessary variables for fun
    double *frodo = (double *)malloc(size * sizeof(double));
    double *sam = (double *)malloc(size * sizeof(double));
    if (frodo == NULL || sam == NULL) {
        printf("Memory allocation failed\n");
        exit(1);
    }

    for (int i = 0; i < size; i++) {
        frodo[i] = signal[i];
        sam[i] = signal[i];
    }

    free(frodo);
    free(sam);

    // End of our lovely program
    printf("Wavelet transform complete.\n");

    return 0;
}

