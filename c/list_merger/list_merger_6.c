#include <stdio.h>
#include <stdlib.h>

// This program merges two sorted lists into a single sorted list.
// It takes input from the user for the two lists, merges them, and prints the result.
// The program assumes that the input lists are sorted in ascending order.

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

    // Prompt the user to enter the size of the first list
    printf("Enter the size of the first list: ");
    scanf("%d", &size1);

    // Allocate memory for the first list
    int *list1 = (int *)malloc(size1 * sizeof(int));

    // Prompt the user to enter the elements of the first list
    printf("Enter the elements of the first list: ");
    for (int i = 0; i < size1; i++) {
        scanf("%d", &list1[i]);
    }

    // Prompt the user to enter the size of the second list
    printf("Enter the size of the second list: ");
    scanf("%d", &size2);

    // Allocate memory for the second list
    int *list2 = (int *)malloc(size2 * sizeof(int));

    // Prompt the user to enter the elements of the second list
    printf("Enter the elements of the second list: ");
    for (int i = 0; i < size2; i++) {
        scanf("%d", &list2[i]);
    }

    // Allocate memory for the merged list
    int *mergedList = (int *)malloc((size1 + size2) * sizeof(int));

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
    free(mergedList);

    return 0;
}

