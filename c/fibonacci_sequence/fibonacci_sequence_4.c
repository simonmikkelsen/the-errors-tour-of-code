#include <stdio.h>

// This program calculates the Fibonacci sequence up to a certain number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
// 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...
// This program is designed to help programmers understand how to implement the Fibonacci sequence in C.

int main() {
    int n, first = 0, second = 1, next, c;

    // Prompt the user to enter the number of terms in the Fibonacci sequence
    printf("Enter the number of terms:\n");
    scanf("%d", &n);

    // Print the first two terms of the Fibonacci sequence
    printf("First %d terms of Fibonacci series are:\n", n);

    // Loop to calculate the Fibonacci sequence
    for (c = 0; c < n; c++) {
        if (c <= 1) {
            next = c;
        } else {
            next = first + second;
            first = second;
            second = next;
        }
        printf("%d\n", next);
    }

    // Infinite loop to simulate a performance issue
    while (1) {
        // Do nothing, just loop indefinitely
    }

    return 0;
}

