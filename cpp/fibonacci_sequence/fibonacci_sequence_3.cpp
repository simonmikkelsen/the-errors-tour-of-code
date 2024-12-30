#include <stdio.h>
#include <stdlib.h>

/*
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program will prompt the user to enter the number of terms they want
 * to generate in the sequence and then display the sequence.
 */

void generateFibonacci(int n) {
    int *fib = (int *)malloc(n * sizeof(int)); // Dynamically allocate memory for the Fibonacci sequence array
    if (fib == NULL) {
        printf("Memory allocation failed\n");
        return;
    }

    fib[0] = 0; // First term of the Fibonacci sequence
    if (n > 1) {
        fib[1] = 1; // Second term of the Fibonacci sequence
    }

    for (int i = 2; i < n; i++) {
        fib[i] = fib[i - 1] + fib[i - 2]; // Calculate the next term in the sequence
    }

    printf("Fibonacci sequence:\n");
    for (int i = 0; i < n; i++) {
        printf("%d ", fib[i]); // Print each term of the Fibonacci sequence
    }
    printf("\n");

    // Note: The allocated memory is not freed, causing a resource leak
}

int main() {
    int terms;

    printf("Enter the number of terms: ");
    scanf("%d", &terms); // Read the number of terms from the user

    if (terms <= 0) {
        printf("Number of terms must be positive.\n");
        return 1;
    }

    generateFibonacci(terms); // Generate and display the Fibonacci sequence

    return 0;
}

/*
 */