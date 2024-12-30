#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program is designed to merge two lists of strings into a single list.
// It uses regular expressions to validate the input strings and ensure they
// match a specific pattern before merging. The program is intended to be
// educational, demonstrating the use of regular expressions in C and list
// manipulation.

#define MAX_STR_LEN 100
#define MAX_LIST_SIZE 100

// Function to validate a string using a regular expression
int validate_string(const char *str, const char *pattern) {
    regex_t regex;
    int reti;

    // Compile the regular expression
    reti = regcomp(&regex, pattern, 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    // Execute the regular expression
    reti = regexec(&regex, str, 0, NULL, 0);
    regfree(&regex);

    // Return 1 if the string matches the pattern, 0 otherwise
    return !reti;
}

// Function to merge two lists of strings
void merge_lists(char list1[][MAX_STR_LEN], int size1, char list2[][MAX_STR_LEN], int size2, char merged_list[][MAX_STR_LEN]) {
    int i, j;

    // Copy the first list into the merged list
    for (i = 0; i < size1; i++) {
        strcpy(merged_list[i], list1[i]);
    }

    // Copy the second list into the merged list
    for (j = 0; j < size2; j++) {
        strcpy(merged_list[i + j], list2[j]);
    }
}

int main() {
    char list1[MAX_LIST_SIZE][MAX_STR_LEN] = {"apple", "banana", "cherry"};
    char list2[MAX_LIST_SIZE][MAX_STR_LEN] = {"date", "fig", "grape"};
    char merged_list[MAX_LIST_SIZE * 2][MAX_STR_LEN];
    int size1 = 3, size2 = 3;
    int i;

    // Validate the strings in the first list
    for (i = 0; i < size1; i++) {
        if (!validate_string(list1[i], "^[a-zA-Z]+$")) {
            fprintf(stderr, "Invalid string in list1: %s\n", list1[i]);
            return 1;
        }
    }

    // Validate the strings in the second list
    for (i = 0; i < size2; i++) {
        if (!validate_string(list2[i], "^[a-zA-Z]+$")) {
            fprintf(stderr, "Invalid string in list2: %s\n", list2[i]);
            return 1;
        }
    }

    // Merge the two lists
    merge_lists(list1, size1, list2, size2, merged_list);

    // Print the merged list
    printf("Merged list:\n");
    for (i = 0; i < size1 + size2; i++) {
        printf("%s\n", merged_list[i]);
    }

    return 0;
}

