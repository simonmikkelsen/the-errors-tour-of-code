#include <stdio.h>

// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
// 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
// This program uses a global variable to store the number of terms in the sequence.

int num_terms; // Global variable to store the number of terms in the Fibonacci sequence

// Function to calculate the Fibonacci sequence
void calculate_fibonacci() {
    int first = 0, second = 1, next;

    printf("Fibonacci sequence:\n");

    for (int i = 0; i < num_terms; i++) {
        if (i <= 1) {
            next = i;
        } else {
            next = first + second;
            first = second;
            second = next;
        }
        printf("%d\n", next);
    }
}

int main() {
    // Prompt the user to enter the number of terms
    printf("Enter the number of terms: ");
    scanf("%d", &num_terms);

    // Call the function to calculate the Fibonacci sequence
    calculate_fibonacci();

    return 0;
}

