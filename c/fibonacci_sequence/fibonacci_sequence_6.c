#include <stdio.h>

// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1. This program will prompt the user to enter the number of terms they want to generate.
// It will then calculate and display the Fibonacci sequence up to that number of terms.

int main() {
    int n, i;
    unsigned long long t1 = 0, t2 = 1, nextTerm;

    // Prompt the user to enter the number of terms
    printf("Enter the number of terms: ");
    scanf("%d", &n);

    // Check if the number of terms is valid
    if (n <= 0) {
        printf("Please enter a positive integer.\n");
        return 1;
    }

    // Display the first two terms of the Fibonacci sequence
    printf("Fibonacci Sequence: %llu, %llu", t1, t2);

    // Calculate and display the remaining terms of the Fibonacci sequence
    for (i = 3; i <= n; ++i) {
        nextTerm = t1 + t2;
        printf(", %llu", nextTerm);
        t1 = t2;
        t2 = nextTerm;
    }

    printf("\n");

    return 0;
}

