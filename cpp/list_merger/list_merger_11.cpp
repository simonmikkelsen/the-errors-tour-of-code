#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program is designed to merge two lists of integers into a single sorted list.
// It uses regular expressions to parse input strings and extract integers.
// The program demonstrates the use of dynamic memory allocation, regular expressions, and sorting algorithms.

#define MAX_INPUT_SIZE 1024
#define MAX_NUMBERS 100

// Function to parse a string and extract integers using regular expressions
int parse_numbers(const char *input, int *numbers) {
    regex_t regex;
    regmatch_t pmatch[1];
    const char *pattern = "[0-9]+";
    int count = 0;

    // Compile the regular expression
    if (regcomp(&regex, pattern, REG_EXTENDED) != 0) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    // Execute the regular expression and extract numbers
    const char *p = input;
    while (regexec(&regex, p, 1, pmatch, 0) == 0) {
        char num_str[10];
        int len = pmatch[0].rm_eo - pmatch[0].rm_so;
        strncpy(num_str, p + pmatch[0].rm_so, len);
        num_str[len] = '\0';
        numbers[count++] = atoi(num_str);
        p += pmatch[0].rm_eo;
    }

    // Free the compiled regular expression
    regfree(&regex);

    return count;
}

// Function to merge two sorted arrays into a single sorted array
void merge(int *arr1, int n1, int *arr2, int n2, int *result) {
    int i = 0, j = 0, k = 0;

    // Merge the arrays
    while (i < n1 && j < n2) {
        if (arr1[i] < arr2[j]) {
            result[k++] = arr1[i++];
        } else {
            result[k++] = arr2[j++];
        }
    }

    // Copy remaining elements of arr1, if any
    while (i < n1) {
        result[k++] = arr1[i++];
    }

    // Copy remaining elements of arr2, if any
    while (j < n2) {
        result[k++] = arr2[j++];
    }
}

int main() {
    char input1[MAX_INPUT_SIZE];
    char input2[MAX_INPUT_SIZE];
    int numbers1[MAX_NUMBERS];
    int numbers2[MAX_NUMBERS];
    int merged[MAX_NUMBERS * 2];
    int count1, count2;

    // Read two input strings
    printf("Enter the first list of numbers: ");
    fgets(input1, MAX_INPUT_SIZE, stdin);
    printf("Enter the second list of numbers: ");
    fgets(input2, MAX_INPUT_SIZE, stdin);

    // Parse the input strings to extract numbers
    count1 = parse_numbers(input1, numbers1);
    count2 = parse_numbers(input2, numbers2);

    // Merge the two lists
    merge(numbers1, count1, numbers2, count2, merged);

    // Print the merged list
    printf("Merged list: ");
    for (int i = 0; i < count1 + count2; i++) {
        printf("%d ", merged[i]);
    }
    printf("\n");

    return 0;
}

