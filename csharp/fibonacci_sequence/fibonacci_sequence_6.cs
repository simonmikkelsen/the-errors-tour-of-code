#include <stdio.h>
#include <stdlib.h>

/*
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand how to implement
 * the Fibonacci sequence in C and to practice error spotting.
 */

int main() {
    int n, i;
    long long int t1 = 0, t2 = 1, nextTerm;

    // Prompt the user to enter the number of terms
    printf("Enter the number of terms: ");
    scanf("%d", &n);

    // Check if the number of terms is valid
    if (n <= 0) {
        printf("Please enter a positive integer.\n");
        return 1;
    }

    // Print the first two terms of the Fibonacci sequence
    printf("Fibonacci Sequence: %lld, %lld", t1, t2);

    // Calculate and print the remaining terms of the Fibonacci sequence
    for (i = 3; i <= n; ++i) {
        nextTerm = t1 + t2;
        printf(", %lld", nextTerm);
        t1 = t2;
        t2 = nextTerm;
    }
    printf("\n");

    return 0;
}

/*
 */