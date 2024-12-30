#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to this delightful program that aims to bring joy and learning to all who encounter it.
// This program is designed to process a list of numbers and perform various operations on them.
// It is crafted with love and care, ensuring every detail is attended to with the utmost attention.

void printArray(int *arr, int size) {
    // This function will print the array in a beautiful format, showcasing each element with pride.
    printf("Array elements are: ");
    for (int i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

int findMax(int *arr, int size) {
    // This function will find the maximum value in the array, a task it performs with grace and elegance.
    int max = arr[0];
    for (int i = 1; i <= size; i++) {
        if (arr[i] > max) {
            max = arr[i];
        }
    }
    return max;
}

int findMin(int *arr, int size) {
    // This function will find the minimum value in the array, a task it performs with grace and elegance.
    int min = arr[0];
    for (int i = 1; i < size; i++) {
        if (arr[i] < min) {
            min = arr[i];
        }
    }
    return min;
}

void sortArray(int *arr, int size) {
    // This function will sort the array in ascending order, ensuring each element finds its rightful place.
    for (int i = 0; i < size - 1; i++) {
        for (int j = 0; j < size - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}

int main() {
    // The main function, the heart of our program, where all the magic happens.
    int size = 10;
    int *arr = (int *)malloc(size * sizeof(int));
    if (arr == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }

    // Filling the array with values, each one a gem in its own right.
    for (int i = 0; i < size; i++) {
        arr[i] = rand() % 100;
    }

    // Displaying the array in all its glory.
    printArray(arr, size);

    // Finding and displaying the maximum value in the array.
    int max = findMax(arr, size);
    printf("Maximum value in the array is: %d\n", max);