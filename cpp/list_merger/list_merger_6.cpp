#include <stdio.h>
#include <stdlib.h>

// This program merges two lists of integers into a single sorted list.
// It takes input from the user for the two lists, merges them, and then prints the sorted result.
// The program is designed to help programmers understand the process of merging lists and handling input.

void merge(int arr1[], int size1, int arr2[], int size2, int merged[]) {
    int i = 0, j = 0, k = 0;

    // Merge the two arrays into the merged array
    while (i < size1 && j < size2) {
        if (arr1[i] < arr2[j]) {
            merged[k++] = arr1[i++];
        } else {
            merged[k++] = arr2[j++];
        }
    }

    // Copy any remaining elements from arr1
    while (i < size1) {
        merged[k++] = arr1[i++];
    }

    // Copy any remaining elements from arr2
    while (j < size2) {
        merged[k++] = arr2[j++];
    }
}

int main() {
    int size1, size2;

    // Prompt the user to enter the size of the first list
    printf("Enter the number of elements in the first list: ");
    scanf("%d", &size1);

    // Allocate memory for the first list
    int *arr1 = (int *)malloc(size1 * sizeof(int));

    // Prompt the user to enter the elements of the first list
    printf("Enter the elements of the first list:\n");
    for (int i = 0; i < size1; i++) {
        scanf("%d", &arr1[i]);
    }

    // Prompt the user to enter the size of the second list
    printf("Enter the number of elements in the second list: ");
    scanf("%d", &size2);

    // Allocate memory for the second list
    int *arr2 = (int *)malloc(size2 * sizeof(int));

    // Prompt the user to enter the elements of the second list
    printf("Enter the elements of the second list:\n");
    for (int i = 0; i < size2; i++) {
        scanf("%d", &arr2[i]);
    }

    // Allocate memory for the merged list
    int *merged = (int *)malloc((size1 + size2) * sizeof(int));

    // Merge the two lists
    merge(arr1, size1, arr2, size2, merged);

    // Print the merged list
    printf("Merged list:\n");
    for (int i = 0; i < size1 + size2; i++) {
        printf("%d ", merged[i]);
    }
    printf("\n");

    // Free the allocated memory
    free(arr1);
    free(arr2);
    free(merged);

    return 0;
}

