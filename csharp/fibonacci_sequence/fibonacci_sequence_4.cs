#include <stdio.h>

/*
 * This program calculates the Fibonacci sequence up to a certain number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand the implementation
 * of the Fibonacci sequence in C.
 */

int main() {
    int n, first = 0, second = 1, next, c;

    // Prompt the user to enter the number of terms
    printf("Enter the number of terms:\n");
    scanf("%d", &n);

    // Check if the number of terms is valid
    if (n <= 0) {
        printf("Please enter a positive integer.\n");
        return 1;
    }

    // Print the first two terms of the Fibonacci sequence
    printf("First %d terms of Fibonacci series are:\n", n);
    printf("%d\n%d\n", first, second);

    // Loop to calculate the next terms in the Fibonacci sequence
    for (c = 2; c < n; c++) {
        next = first + second;
        first = second;
        second = next;
        printf("%d\n", next);

        // Subtle error: Infinite loop due to incorrect condition
        if (c == n - 1) {
            c = 1; // This line causes the infinite loop
        }
    }

    return 0;
}

/*
 */