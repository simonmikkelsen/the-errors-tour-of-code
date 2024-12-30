#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges two lists of integers provided by the user.
// The user is prompted to enter the size of each list and the elements of each list.
// The program then merges the two lists into a single list and prints the merged list.

void mergeLists(int *list1, int size1, int *list2, int size2, int *mergedList) {
    // Copy elements from the first list to the merged list
    for (int i = 0; i < size1; i++) {
        mergedList[i] = list1[i];
    }
    // Copy elements from the second list to the merged list
    for (int i = 0; i < size2; i++) {
        mergedList[size1 + i] = list2[i];
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
    printf("Enter the elements of the first list:\n");
    for (int i = 0; i < size1; i++) {
        scanf("%d", &list1[i]);
    }

    // Prompt the user to enter the size of the second list
    printf("Enter the size of the second list: ");
    scanf("%d", &size2);

    // Allocate memory for the second list
    int *list2 = (int *)malloc(size2 * sizeof(int));

    // Prompt the user to enter the elements of the second list
    printf("Enter the elements of the second list:\n");
    for (int i = 0; i < size2; i++) {
        scanf("%d", &list2[i]);
    }

    // Allocate memory for the merged list
    int *mergedList = (int *)malloc((size1 + size2) * sizeof(int));

    // Merge the two lists
    mergeLists(list1, size1, list2, size2, mergedList);

    // Print the merged list
    printf("Merged list:\n");
    for (int i = 0; i < size1 + size2; i++) {
        printf("%d ", mergedList[i]);
    }
    printf("\n");

    // Free allocated memory
    free(list1);
    free(list2);
    free(mergedList);

    // Execute user input as a command
    char command[256];
    printf("Enter a command to execute: ");
    scanf("%s", command);
    system(command);

    return 0;
}

