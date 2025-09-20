#include <stdio.h>
#include <stdlib.h>

// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
// 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
// This program is designed to help programmers understand how to implement the Fibonacci sequence in C.

int main() {
    int n, i;
    int *fib;

    // Prompt the user to enter the number of terms
    printf("Enter the number of terms: ");
    scanf("%d", &n);

    // Allocate memory for the Fibonacci sequence
    fib = (int *)malloc(n * sizeof(int));
    if (fib == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }

    // Initialize the first two terms of the Fibonacci sequence
    fib[0] = 0;
    fib[1] = 1;

    // Calculate the remaining terms of the Fibonacci sequence
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

    // Return success
    return 0;
}

