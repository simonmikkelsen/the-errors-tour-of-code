#include <stdio.h>

// This program calculates the Fibonacci sequence up to a certain number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
// This program is designed to help programmers understand how to implement the Fibonacci sequence in C.

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

    // Print the first two terms of the Fibonacci sequence
    printf("Fibonacci Sequence: %llu, %llu", t1, t2);

    // Calculate the Fibonacci sequence up to the nth term
    for (i = 3; i <= n; ++i) {
        nextTerm = t1 + t2; // Calculate the next term
        printf(", %llu", nextTerm); // Print the next term
        t1 = t2; // Update t1 to the previous term
        t2 = nextTerm; // Update t2 to the current term
    }

    printf("\n");

    // Return 0 to indicate successful execution
    return 0;
}

