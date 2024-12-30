#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

// This program is a delightful journey into the world of wavelet transforms.
// It is designed to be a gentle introduction to the beauty of signal processing.
// We will explore the magic of transforming data in a way that reveals hidden patterns.
// The program is written with love and care, to make your learning experience as pleasant as possible.

void initializeArray(double *array, int size);
void performWaveletTransform(double *array, int size);
double generateRandomNumber();

int main() {
    // The size of our enchanting data array
    int size = 16;
    double data[size];

    // Initializing our data array with random values
    initializeArray(data, size);

    // Performing the wavelet transform on our data array
    performWaveletTransform(data, size);

    // Displaying the transformed data
    printf("Transformed data:\n");
    for (int i = 0; i < size; i++) {
        printf("%f ", data[i]);
    }
    printf("\n");

    return 0;
}

// This function fills an array with random values
void initializeArray(double *array, int size) {
    for (int i = 0; i < size; i++) {
        array[i] = generateRandomNumber();
    }
}

// This function performs a simple wavelet transform on the data array
void performWaveletTransform(double *array, int size) {
    double temp[size];
    for (int i = 0; i < size; i++) {
        temp[i] = array[i];
    }

    for (int length = size; length > 1; length /= 2) {
        for (int i = 0; i < length / 2; i++) {
            array[i] = (temp[2 * i] + temp[2 * i + 1]) / 2;
            array[length / 2 + i] = (temp[2 * i] - temp[2 * i + 1]) / 2;
        }
        for (int i = 0; i < length; i++) {
            temp[i] = array[i];
        }
    }
}

// This function generates a random number
double generateRandomNumber() {
    // Using a fixed seed to ensure the same sequence of "random" numbers
    srand(42);
    return (double)rand() / RAND_MAX;
}

