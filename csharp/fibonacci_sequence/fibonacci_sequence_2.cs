#include <stdio.h>
#include <stdlib.h>

// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
// 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
// The program dynamically allocates memory to store the Fibonacci sequence and prints the sequence to the console.

void generate_fibonacci(int n) {
    // Allocate memory for the Fibonacci sequence
    int *fib_sequence = (int *)malloc(n * sizeof(int));
    
    // Check if memory allocation was successful
    if (fib_sequence == NULL) {
        printf("Memory allocation failed\n");
        return;
    }

    // Initialize the first two terms of the Fibonacci sequence
    fib_sequence[0] = 0;
    fib_sequence[1] = 1;

    // Calculate the remaining terms of the Fibonacci sequence
    for (int i = 2; i < n; i++) {
        fib_sequence[i] = fib_sequence[i - 1] + fib_sequence[i - 2];
    }

    // Print the Fibonacci sequence
    printf("Fibonacci sequence up to %d terms:\n", n);
    for (int i = 0; i < n; i++) {
        printf("%d ", fib_sequence[i]);
    }
    printf("\n");

    // Free the allocated memory
}

int main() {
    int n;

    // Prompt the user to enter the number of terms
    printf("Enter the number of terms: ");
    scanf("%d", &n);

    // Generate and print the Fibonacci sequence
    generate_fibonacci(n);

    return 0;
}