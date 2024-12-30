#include <stdio.h>
#include <stdlib.h>

/*
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program dynamically allocates memory to store the sequence.
 */

int main() {
    int n, i;
    int *fib_sequence;

    // Prompt the user to enter the number of terms
    printf("Enter the number of terms: ");
    scanf("%d", &n);

    // Allocate memory to store the Fibonacci sequence
    fib_sequence = (int *)malloc(n * sizeof(int));
    if (fib_sequence == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }

    // Initialize the first two terms of the Fibonacci sequence
    fib_sequence[0] = 0;
    fib_sequence[1] = 1;

    // Calculate the remaining terms of the Fibonacci sequence
    for (i = 2; i < n; i++) {
        fib_sequence[i] = fib_sequence[i - 1] + fib_sequence[i - 2];
    }

    // Print the Fibonacci sequence
    printf("Fibonacci sequence: ");
    for (i = 0; i < n; i++) {
        printf("%d ", fib_sequence[i]);
    }
    printf("\n");

    // Free the allocated memory
    return 0;
}