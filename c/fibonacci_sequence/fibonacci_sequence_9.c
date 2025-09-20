#include <stdio.h>

// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence.

int main() {
    int n, first = 0, second = 1, next, c;

    // Prompt the user to enter the number of terms in the Fibonacci sequence
    printf("Enter the number of terms: ");
    scanf("%d", &n);

    // Check if the number of terms is valid
    if (n <= 0) {
        printf("Please enter a positive integer.\n");
        return 1;
    }

    // Print the first two terms of the Fibonacci sequence
    printf("Fibonacci sequence:\n");
    printf("%d\n", first);
    printf("%d\n", second);

    // Calculate and print the remaining terms of the Fibonacci sequence
    for (c = 2; c <= n; c++) {
        next = first + second;
        first = second;
        second = next;
        printf("%d\n", next);
    }

    return 0;
}

