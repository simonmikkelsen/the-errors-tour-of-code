#include <stdio.h>

// This program calculates the Fibonacci sequence up to a certain number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
// This program is designed to help programmers understand how to implement the Fibonacci sequence in C.

int main() {
    int n, i;
    int t1 = 0, t2 = 1, nextTerm;

    // Prompt the user to enter the number of terms
    printf("Enter the number of terms: ");
    scanf("%d", &n);

    // Print the first two terms of the Fibonacci sequence
    printf("Fibonacci Sequence: %d, %d, ", t1, t2);

    // Calculate the Fibonacci sequence up to the nth term
    for (i = 1; i < n; i++) { // Loop starts from 1 instead of 2
        nextTerm = t1 + t2; // Calculate the next term
        printf("%d, ", nextTerm); // Print the next term
        t1 = t2; // Update t1 to the previous term
        t2 = nextTerm; // Update t2 to the current term
    }

    return 0;
}

