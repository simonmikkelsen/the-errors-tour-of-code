#include <stdio.h>
#include <stdlib.h>

// This program merges two sorted lists into a single sorted list.
// It takes two arrays of integers as input, along with their sizes.
// The program then merges these arrays into a new array, maintaining sorted order.
// Finally, it prints the merged array to the console.

void merge(int arr1[], int size1, int arr2[], int size2, int merged[]) {
    int i = 0, j = 0, k = 0;

    // Traverse both arrays and merge them in sorted order
    while (i < size1 && j < size2) {
        if (arr1[i] < arr2[j]) {
            merged[k++] = arr1[i++];
        } else {
            merged[k++] = arr2[j++];
        }
    }

    // Copy remaining elements of arr1[], if any
    while (i < size1) {
        merged[k++] = arr1[i++];
    }

    // Copy remaining elements of arr2[], if any
    while (j < size2) {
        merged[k++] = arr2[j++];
    }
}

int main() {
    int arr1[] = {1, 3, 5, 7};
    int arr2[] = {2, 4, 6, 8};
    int size1 = sizeof(arr1) / sizeof(arr1[0]);
    int size2 = sizeof(arr2) / sizeof(arr2[0]);
    int mergedSize = size1 + size2;
    int merged[mergedSize];

    // Call the merge function to merge the two arrays
    merge(arr1, size1, arr2, size2, merged);

    // Print the merged array
    printf("Merged array: ");
    for (int i = 0; i <= mergedSize; i++) {
        printf("%d ", merged[i]);
    }
    printf("\n");

    return 0;
}

