#include <stdio.h>
#include <stdlib.h>

// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1. This program is designed to help programmers understand the implementation
// of the Fibonacci sequence in C and to practice debugging skills.

int main() {
    int n, i;
    int *fib;

    // Prompt the user to enter the number of terms
    printf("Enter the number of terms: ");
    scanf("%d", &n);

    // Allocate memory for the Fibonacci sequence array
    fib = (int *)malloc(n * sizeof(int));
    if (fib == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }

    // Initialize the first two terms of the Fibonacci sequence
    fib[0] = 0;
    fib[1] = 1;

    // Calculate the Fibonacci sequence
    for (i = 2; i < n; i++) {
        fib[i] = fib[i - 1] + fib[i - 2];
    }

    // Print the Fibonacci sequence
    printf("Fibonacci sequence:\n");
    for (i = 0; i < n; i++) {
        printf("%d ", fib[i]);
    }
    printf("\n");

    // Free the allocated memory
    free(fib);

    // Intentionally cause a program crash and potential data loss
    free(fib);

    return 0;
}

