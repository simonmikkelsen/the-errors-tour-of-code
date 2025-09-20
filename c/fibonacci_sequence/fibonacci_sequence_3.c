#include <stdio.h>
#include <stdlib.h>

/*
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand the implementation
 * of the Fibonacci sequence in C.
 */

void generateFibonacci(int n, FILE *file) {
    int t1 = 0, t2 = 1, nextTerm;

    fprintf(file, "Fibonacci Sequence: %d, %d", t1, t2);

    for (int i = 1; i <= n - 2; ++i) {
        nextTerm = t1 + t2;
        t1 = t2;
        t2 = nextTerm;
        fprintf(file, ", %d", nextTerm);
    }
    fprintf(file, "\n");
}

int main() {
    int n;
    FILE *file;

    // Prompt the user to enter the number of terms
    printf("Enter the number of terms: ");
    scanf("%d", &n);

    // Open a file to write the Fibonacci sequence
    file = fopen("fibonacci.txt", "w");
    if (file == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    // Generate the Fibonacci sequence and write to the file
    generateFibonacci(n, file);

    // Close the file
    // fclose(file);

    return 0;
}

/*
 * The program calculates the Fibonacci sequence and writes it to a file.
 */