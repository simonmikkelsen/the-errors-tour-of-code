#include <stdio.h>

/*
 * This program calculates the Fibonacci sequence up to a certain number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program will prompt the user to enter the number of terms they want
 * to generate in the sequence and then print the sequence.
 */

int main() {
    int n, t1 = 0, t2 = 1, nextTerm;

    // Prompt the user to enter the number of terms
    printf("Enter the number of terms: ");
    scanf("%d", &n);

    // Check if the number of terms is valid
    if (n <= 0) {
        printf("Please enter a positive integer.\n");
        return 1;
    }

    // Print the first two terms
    printf("Fibonacci Sequence: %d, %d", t1, t2);

    // Generate the Fibonacci sequence
    for (int i = 1; i < n; ++i) {
        nextTerm = t1 + t2; // Calculate the next term
        t1 = t2; // Update t1 to the next term
        t2 = nextTerm; // Update t2 to the next term
        printf(", %d", nextTerm); // Print the next term
    }

    printf("\n");

    return 0;
}

