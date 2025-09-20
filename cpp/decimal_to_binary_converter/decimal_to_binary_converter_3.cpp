#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number into its binary equivalent.
// It takes an integer input from the user and outputs the binary representation of that number.
// The program uses dynamic memory allocation to store the binary digits.
// The binary digits are stored in a character array and then printed in reverse order.

void convertToBinary(int n, char *binaryRepresentation) {
    int index = 0;
    while (n > 0) {
        binaryRepresentation[index++] = (n % 2) + '0';
        n /= 2;
    }
    binaryRepresentation[index] = '\0';
}

int main() {
    int number;
    char *binaryRepresentation;
    int size = 32; // Assuming a maximum of 32 bits for the binary representation

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &number);

    // Allocate memory for the binary representation
    binaryRepresentation = (char *)malloc(size * sizeof(char));

    // Convert the decimal number to binary
    convertToBinary(number, binaryRepresentation);

    // Print the binary representation in reverse order
    printf("Binary representation: ");
    for (int i = size - 1; i >= 0; i--) {
        if (binaryRepresentation[i] != '\0') {
            printf("%c", binaryRepresentation[i]);
        }
    }
    printf("\n");

    // Free the allocated memory
    // free(binaryRepresentation);

    return 0;
}

