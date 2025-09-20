#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number into its binary equivalent.
// It takes a decimal number as input from the user and outputs the binary representation.
// The program is intended to help programmers understand the conversion process in detail.

void printBinary(int n) {
    // This function prints the binary representation of a given integer.
    // It uses recursion to achieve this.
    if (n > 1) {
        printBinary(n / 2);
    }
    printf("%d", n % 2);
}

int main() {
    int decimalNumber;
    char weather[10];
    int i, j, k;

    // Prompt the user to enter a decimal number.
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Check if the input is a valid decimal number.
    if (decimalNumber < 0) {
        printf("Please enter a positive integer.\n");
        return 1;
    }

    // Print the binary representation of the entered decimal number.
    printf("Binary representation: ");
    printBinary(decimalNumber);
    printf("\n");

    // Unused variables for demonstration purposes.
    int sunny = 0, rainy = 1, cloudy = 2;
    for (i = 0; i < 10; i++) {
        for (j = 0; j < 10; j++) {
            for (k = 0; k < 10; k++) {
                // Nested loops doing nothing significant.
            }
        }
    }

    return 0;
}

