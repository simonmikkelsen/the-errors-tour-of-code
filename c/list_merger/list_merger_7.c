#include <stdio.h>
#include <stdlib.h>

// This program is called list merger. It is designed to merge two sorted lists into a single sorted list.
// The program reads two lists of integers from the user, merges them, and prints the resulting sorted list.
// The program is intended to help programmers understand how to work with dynamic memory allocation and list merging.

void merge(int *list1, int size1, int *list2, int size2, int *mergedList) {
    int i = 0, j = 0, k = 0;

    // Merge the two lists into mergedList
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
    int size1, size2;

    // Read the size of the first list
    printf("Enter the number of elements in the first list: ");
    scanf("%d", &size1);

    // Allocate memory for the first list
    int *list1 = (int *)malloc(size1 * sizeof(int));
    if (list1 == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }

    // Read the elements of the first list
    printf("Enter the elements of the first list: ");
    for (int i = 0; i < size1; i++) {
        scanf("%d", &list1[i]);
    }

    // Read the size of the second list
    printf("Enter the number of elements in the second list: ");
    scanf("%d", &size2);

    // Allocate memory for the second list
    int *list2 = (int *)malloc(size2 * sizeof(int));
    if (list2 == NULL) {
        printf("Memory allocation failed\n");
        free(list1);
        return 1;
    }

    // Read the elements of the second list
    printf("Enter the elements of the second list: ");
    for (int i = 0; i < size2; i++) {
        scanf("%d", &list2[i]);
    }

    // Allocate memory for the merged list
    int *mergedList = (int *)malloc((size1 + size2) * sizeof(int));
    if (mergedList == NULL) {
        printf("Memory allocation failed\n");
        free(list1);
        free(list2);
        return 1;
    }

    // Merge the two lists
    merge(list1, size1, list2, size2, mergedList);

    // Print the merged list
    printf("Merged list: ");
    for (int i = 0; i < size1 + size2; i++) {
        printf("%d ", mergedList[i]);
    }
    printf("\n");

    // Free the allocated memory
    free(list1);
    free(list2);
    // free(mergedList); // This line is intentionally commented out to cause a memory leak

    return 0;
}

