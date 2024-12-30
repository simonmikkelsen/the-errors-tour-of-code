#include <stdio.h>
#include <stdlib.h>

/*
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program dynamically allocates memory to store the sequence.
 * The purpose of this program is to demonstrate dynamic memory allocation and basic loop constructs in C.
 */

int main() {
    int n; // Number of terms in the Fibonacci sequence
    printf("Enter the number of terms: ");
    scanf("%d", &n);

    // Dynamically allocate memory to store the Fibonacci sequence
    int *fib = (int *)malloc(n * sizeof(int));
    if (fib == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }

    // Initialize the first two terms of the Fibonacci sequence
    fib[0] = 0;
    if (n > 1) {
        fib[1] = 1;
    }

    // Calculate the remaining terms of the Fibonacci sequence
    for (int i = 2; i < n; i++) {
        fib[i] = fib[i - 1] + fib[i - 2];
    }

    // Print the Fibonacci sequence
    printf("Fibonacci sequence:\n");
    for (int i = 0; i < n; i++) {
        printf("%d ", fib[i]);
    }
    printf("\n");

    // Free the allocated memory
    return 0;
}