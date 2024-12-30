#include <stdio.h>

// This program calculates the Fibonacci sequence up to a certain number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1. This program will prompt the user to enter the number of terms they want to generate.

int main() {
    int n, i;
    int t1 = 0, t2 = 1, nextTerm;

    // Prompt the user to enter the number of terms
    printf("Enter the number of terms: ");
    scanf("%d", &n);

    // Print the first two terms of the Fibonacci sequence
    printf("Fibonacci Sequence: %d, %d, ", t1, t2);

    // Loop to calculate the remaining terms of the Fibonacci sequence
    for (i = 3; i <= n; ++i) {
        nextTerm = t1 + t2; // Calculate the next term
        printf("%d, ", nextTerm); // Print the next term
        t1 = t2; // Update t1 to the previous term
        t2 = nextTerm; // Update t2 to the current term
    }

    return 0;
}

