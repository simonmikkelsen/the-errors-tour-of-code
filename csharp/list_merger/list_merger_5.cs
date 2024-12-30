#include <stdio.h>
#include <stdlib.h>

// This program merges two sorted lists into a single sorted list.
// The purpose of this program is to demonstrate how to merge two lists
// while maintaining the sorted order. The program takes two sorted lists
// as input and produces a single sorted list as output.

void mergeLists(int *list1, int size1, int *list2, int size2, int *mergedList) {
    int i = 0, j = 0, k = 0;

    // Loop through both lists and merge them into mergedList
    while (i < size1 && j < size2) {
        if (list1[i] < list2[j]) {
            mergedList[k] = list1[i];
            i++;
        } else {
            mergedList[k] = list2[j];
            j++;
        }
        k++;
    }

    // Copy any remaining elements from list1
    while (i < size1) {
        mergedList[k] = list1[i];
        i++;
        k++;
    }

    // Copy any remaining elements from list2
    while (j < size2) {
        mergedList[k] = list2[j];
        j++;
        k++;
    }
}

int main() {
    int list1[] = {1, 3, 5, 7};
    int list2[] = {2, 4, 6, 8};
    int size1 = sizeof(list1) / sizeof(list1[0]);
    int size2 = sizeof(list2) / sizeof(list2[0]);
    int mergedSize = size1 + size2;
    int *mergedList = (int *)malloc(mergedSize * sizeof(int));

    if (mergedList == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }

    // Call the mergeLists function to merge list1 and list2
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

