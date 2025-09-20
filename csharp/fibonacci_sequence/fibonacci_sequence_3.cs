#include <stdio.h>
#include <stdlib.h>

/*
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program will prompt the user to enter the number of terms they want
 * to generate in the sequence and then print the sequence to the console.
 */

void printFibonacci(int n) {
    int *fib = (int *)malloc(n * sizeof(int)); // Dynamically allocate memory for the Fibonacci sequence
    if (fib == NULL) {
        printf("Memory allocation failed\n");
        return;
    }

    fib[0] = 0; // The first term of the Fibonacci sequence
    if (n > 1) {
        fib[1] = 1; // The second term of the Fibonacci sequence
    }

    // Calculate the remaining terms of the Fibonacci sequence
    for (int i = 2; i < n; i++) {
        fib[i] = fib[i - 1] + fib[i - 2];
    }

    // Print the Fibonacci sequence
    for (int i = 0; i < n; i++) {
        printf("%d ", fib[i]);
    }
    printf("\n");

    // Free the allocated memory
    // free(fib); // This line is intentionally commented out to create a resource leak
}

int main() {
    int terms;

    // Prompt the user to enter the number of terms
    printf("Enter the number of terms: ");
    scanf("%d", &terms);

    // Validate the input
    if (terms <= 0) {
        printf("Number of terms must be a positive integer\n");
        return 1;
    }

    // Call the function to print the Fibonacci sequence
    printFibonacci(terms);

    return 0;
}

/*
 */