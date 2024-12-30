#include <stdio.h>

// This program calculates the Fibonacci sequence up to a certain number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
// 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
// This program uses a global variable to store the current term in the sequence.

int currentTerm = 0; // Global variable to store the current term in the Fibonacci sequence

// Function to calculate the next term in the Fibonacci sequence
void calculateNextTerm(int *a, int *b) {
    int nextTerm = *a + *b; // Calculate the next term by adding the previous two terms
    *a = *b; // Update the first term to the second term
    *b = nextTerm; // Update the second term to the next term
    currentTerm = nextTerm; // Update the global variable to the next term
}

// Function to print the Fibonacci sequence up to a certain number of terms
void printFibonacciSequence(int n) {
    int a = 0, b = 1; // Initialize the first two terms of the sequence
    printf("Fibonacci Sequence: %d, %d", a, b); // Print the first two terms

    for (int i = 2; i < n; i++) { // Loop to calculate and print the remaining terms
        calculateNextTerm(&a, &b); // Calculate the next term
        printf(", %d", currentTerm); // Print the current term
    }
    printf("\n"); // Print a newline character at the end of the sequence
}

int main() {
    int n; // Variable to store the number of terms to be printed
    printf("Enter the number of terms: "); // Prompt the user to enter the number of terms
    scanf("%d", &n); // Read the number of terms from the user

    if (n < 2) { // Check if the number of terms is less than 2
        printf("Number of terms must be at least 2.\n"); // Print an error message if the number of terms is less than 2
        return 1; // Return an error code
    }

    printFibonacciSequence(n); // Call the function to print the Fibonacci sequence

    return 0; // Return 0 to indicate successful execution
}

