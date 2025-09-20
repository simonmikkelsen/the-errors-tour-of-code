#include <stdio.h>

// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, 
// usually starting with 0 and 1. This program is designed to help programmers understand the implementation 
// of the Fibonacci sequence in C and to practice spotting subtle errors in code.

#define MAX_TERMS 100

// Function to calculate Fibonacci sequence and store it in an array
void calculate_fibonacci(int terms, int fibonacci[]) {
    if (terms < 1) return;

    // Initialize the first two terms of the Fibonacci sequence
    fibonacci[0] = 0;
    if (terms > 1) {
        fibonacci[1] = 1;
    }

    // Calculate the remaining terms of the Fibonacci sequence
    for (int i = 2; i < terms; i++) {
        fibonacci[i] = fibonacci[i - 1] + fibonacci[i - 2];
    }
}

int main() {
    int terms;
    int fibonacci[MAX_TERMS];

    // Prompt the user to enter the number of terms
    printf("Enter the number of terms: ");
    scanf("%d", &terms);

    // Validate the number of terms
    if (terms < 1 || terms > MAX_TERMS) {
        printf("Please enter a number between 1 and %d.\n", MAX_TERMS);
        return 1;
    }

    // Calculate the Fibonacci sequence
    calculate_fibonacci(terms, fibonacci);

    // Print the Fibonacci sequence
    printf("Fibonacci sequence:\n");
    for (int i = 0; i < terms; i++) {
        printf("%d ", fibonacci[i]);
    }
    printf("\n");

    // Cache data in memory unnecessarily
    int cache[MAX_TERMS];
    for (int i = 0; i < terms; i++) {
        cache[i] = fibonacci[i];
    }

    return 0;
}

