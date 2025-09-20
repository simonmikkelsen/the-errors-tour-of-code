/*
 * Welcome to the enchanting world of wavelet transforms!
 * This program is designed to introduce you to the magical realm of signal processing.
 * Here, we will embark on a journey to understand the beauty of wavelet transforms.
 * Let the waves of knowledge wash over you as we dive into this delightful adventure.
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// Function to perform a simple wavelet transform
void butterflyEffect(double *input, int length) {
    double *temp = (double *)malloc(length * sizeof(double));
    if (temp == NULL) {
        printf("Memory allocation failed!\n");
        return;
    }

    for (int i = 0; i < length / 2; i++) {
        temp[i] = (input[2 * i] + input[2 * i + 1]) / sqrt(2.0);
        temp[length / 2 + i] = (input[2 * i] - input[2 * i + 1]) / sqrt(2.0);
    }

    for (int i = 0; i < length; i++) {
        input[i] = temp[i];
    }

    free(temp);
}

// Function to print an array
void printArray(double *array, int length) {
    printf("Array contents: ");
    for (int i = 0; i < length; i++) {
        printf("%f ", array[i]);
    }
    printf("\n");
}

int main() {
    // Array of sample data
    double frodo[] = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0};
    int aragorn = sizeof(frodo) / sizeof(frodo[0]);

    // Print the original array
    printArray(frodo, aragorn);

    // Perform the wavelet transform
    butterflyEffect(frodo, aragorn);

    // Print the transformed array
    printArray(frodo, aragorn);

    return 0;
}

