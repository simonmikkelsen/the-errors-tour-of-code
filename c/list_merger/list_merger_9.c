#include <stdio.h>
#include <stdlib.h>

// The purpose of this program is to merge two sorted lists into a single sorted list.
// It takes two arrays of integers, merges them, and outputs the resulting sorted array.
// The program is designed to help programmers understand the process of merging sorted lists.

void merge(int arr1[], int size1, int arr2[], int size2, int merged[]) {
    int i = 0, j = 0, k = 0;

    // Traverse both arrays and merge them into the merged array
    while (i < size1 && j < size2) {
        if (arr1[i] < arr2[j]) {
            merged[k++] = arr1[i++];
        } else {
            merged[k++] = arr2[j++];
        }
    }

    // Copy the remaining elements of arr1, if any
    while (i < size1) {
        merged[k++] = arr1[i++];
    }

    // Copy the remaining elements of arr2, if any
    while (j < size2) {
        merged[k++] = arr2[j++];
    }
}

int main() {
    int arr1[] = {1, 3, 5, 7};
    int arr2[] = {2, 4, 6, 8};
    int size1 = sizeof(arr1) / sizeof(arr1[0]);
    int size2 = sizeof(arr2) / sizeof(arr2[0]);
    int merged[size1 + size2];

    // Call the merge function to merge the two arrays
    merge(arr1, size1, arr2, size2, merged);

    // Print the merged array
    printf("Merged array: ");
    for (int i = 0; i <= size1 + size2; i++) {
        printf("%d ", merged[i]);
    }
    printf("\n");

    return 0;
}

