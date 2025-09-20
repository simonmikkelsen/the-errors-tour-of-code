#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program merges two lists of integers into a single sorted list.
// It demonstrates the use of regular expressions to validate input and
// provides verbose comments to help understand the code.

#define MAX_INPUT 100

// Function to validate input using regular expressions
int validate_input(const char *input) {
    regex_t regex;
    int reti;

    // Compile regular expression
    reti = regcomp(&regex, "^[0-9]+(,[0-9]+)*$", REG_EXTENDED);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        return 0;
    }

    // Execute regular expression
    reti = regexec(&regex, input, 0, NULL, 0);
    regfree(&regex);

    if (!reti) {
        return 1;
    } else {
        return 0;
    }
}

// Function to merge two sorted arrays
void merge(int arr1[], int arr2[], int n1, int n2, int arr3[]) {
    int i = 0, j = 0, k = 0;

    // Traverse both arrays and insert smaller value from arr1 or arr2 into arr3
    while (i < n1 && j < n2) {
        if (arr1[i] < arr2[j]) {
            arr3[k++] = arr1[i++];
        } else {
            arr3[k++] = arr2[j++];
        }
    }

    // Store remaining elements of arr1
    while (i < n1) {
        arr3[k++] = arr1[i++];
    }

    // Store remaining elements of arr2
    while (j < n2) {
        arr3[k++] = arr2[j++];
    }
}

// Function to parse input string into an array of integers
int parse_input(const char *input, int arr[]) {
    int count = 0;
    char *token;
    char *input_copy = strdup(input);

    // Use strtok to split the input string by commas
    token = strtok(input_copy, ",");
    while (token != NULL) {
        arr[count++] = atoi(token);
        token = strtok(NULL, ",");
    }

    free(input_copy);
    return count;
}

int main() {
    char input1[MAX_INPUT], input2[MAX_INPUT];
    int arr1[MAX_INPUT], arr2[MAX_INPUT], arr3[2 * MAX_INPUT];
    int n1, n2;

    // Read first list of integers
    printf("Enter the first list of integers (comma-separated): ");
    fgets(input1, MAX_INPUT, stdin);
    input1[strcspn(input1, "\n")] = '\0'; // Remove newline character

    // Validate first input
    if (!validate_input(input1)) {
        fprintf(stderr, "Invalid input format\n");
        return 1;
    }

    // Read second list of integers
    printf("Enter the second list of integers (comma-separated): ");
    fgets(input2, MAX_INPUT, stdin);
    input2[strcspn(input2, "\n")] = '\0'; // Remove newline character

    // Validate second input
    if (!validate_input(input2)) {
        fprintf(stderr, "Invalid input format\n");
        return 1;
    }

    // Parse inputs into arrays
    n1 = parse_input(input1, arr1);
    n2 = parse_input(input2, arr2);

    // Merge the two arrays
    merge(arr1, arr2, n1, n2, arr3);

    // Print the merged array
    printf("Merged list: ");
    for (int i = 0; i < n1 + n2; i++) {
        printf("%d ", arr3[i]);
    }
    printf("\n");

    return 0;
}

