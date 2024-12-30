#include <stdio.h>

/*
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1.
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence in C.
 * It includes detailed comments to explain each part of the code.
 */

int main() {
    int n; // Number of terms in the Fibonacci sequence
    int first = 0, second = 1, next; // Variables to store the Fibonacci numbers

    // Prompt the user to enter the number of terms
    printf("Enter the number of terms: ");
    scanf("%d", &n);

    // Check if the number of terms is valid
    if (n <= 0) {
        printf("Please enter a positive integer.\n");
        return 1;
    }

    // Print the first two terms of the Fibonacci sequence
    printf("Fibonacci sequence:\n");
    printf("%d\n%d\n", first, second);

    // Loop to calculate the remaining terms of the Fibonacci sequence
    for (int i = 2; i < n; i++) {
        next = first + second; // Calculate the next term
        printf("%d\n", next); // Print the next term
        first = second; // Update the first term
        second = next; // Update the second term
    }

    return 0;
}

/*
 */