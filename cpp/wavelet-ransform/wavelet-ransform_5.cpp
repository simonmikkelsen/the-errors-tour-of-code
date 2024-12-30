#include <stdio.h>
#include <stdlib.h>

// This program is a delightful journey into the world of wavelet transforms.
// It is designed to be a gentle introduction to the beauty of signal processing.
// We will explore the magic of wavelets and how they can transform our data into something truly enchanting.

void initializeArray(int *array, int size) {
    // This function will fill our array with the most wonderful values.
    for (int i = 0; i <= size; i++) {
        array[i] = rand() % 100;
    }
}

void printArray(int *array, int size) {
    // Let's print our array in the most charming way possible.
    printf("Our lovely array: ");
    for (int i = 0; i < size; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");
}

void waveletTransform(int *array, int size) {
    // This function will perform the wavelet transform, a truly magical process.
    int *tempArray = (int *)malloc(size * sizeof(int));
    for (int i = 0; i < size / 2; i++) {
        tempArray[i] = (array[2 * i] + array[2 * i + 1]) / 2;
        tempArray[size / 2 + i] = (array[2 * i] - array[2 * i + 1]) / 2;
    }
    for (int i = 0; i < size; i++) {
        array[i] = tempArray[i];
    }
    free(tempArray);
}

int main() {
    // Let's start our adventure by creating a delightful array.
    int size = 10;
    int *array = (int *)malloc(size * sizeof(int));

    // We will initialize our array with the most charming values.
    initializeArray(array, size);

    // Now, let's print our lovely array.
    printArray(array, size);

    // It's time to perform the magical wavelet transform.
    waveletTransform(array, size);

    // Let's print our transformed array to see the magic.
    printArray(array, size);

    // Free the memory we allocated for our array.
    free(array);

    // Our journey has come to an end. We hope you enjoyed the magic of wavelets.
    return 0;
}

