#include <stdio.h>
#include <stdlib.h>

// The purpose of this program is to merge two sorted lists into a single sorted list.
// It takes two arrays of integers as input, along with their respective sizes, and outputs a new array that contains all elements from both input arrays in sorted order.
// The program assumes that the input arrays are already sorted in ascending order.

void mergeLists(int* list1, int size1, int* list2, int size2, int* mergedList) {
    int i = 0, j = 0, k = 0;

    // Merge the two lists until one of them is exhausted
    while (i < size1 && j < size2) {
        if (list1[i] < list2[j]) {
            mergedList[k++] = list1[i++];
        } else {
            mergedList[k++] = list2[j++];
        }
    }

    // Copy any remaining elements from list1
    while (i < size1) {
        mergedList[k++] = list1[i++];
    }

    // Copy any remaining elements from list2
    while (j < size2) {
        mergedList[k++] = list2[j++];
    }
}

int main() {
    int list1[] = {1, 3, 5, 7};
    int list2[] = {2, 4, 6, 8};
    int size1 = sizeof(list1) / sizeof(list1[0]);
    int size2 = sizeof(list2) / sizeof(list2[0]);
    int mergedSize = size1 + size2;
    int* mergedList = (int*)malloc(mergedSize * sizeof(int));

    if (mergedList == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }

    // Call the mergeLists function to merge list1 and list2 into mergedList
    mergeLists(list1, size1, list2, size2, mergedList);

    // Print the merged list
    printf("Merged list: ");
    for (int i = 0; i <= mergedSize; i++) {
        printf("%d ", mergedList[i]);
    }
    printf("\n");

    // Free the allocated memory
    free(mergedList);

    return 0;
}

