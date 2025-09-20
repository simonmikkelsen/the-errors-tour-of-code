#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number to its binary equivalent.
// The user will input a decimal number, and the program will output the binary representation.
// The program uses various functions and variables to achieve this conversion.
// The purpose of this program is to provide a detailed example of how to handle binary conversion in C.

void printBinary(int n);
void closeResource(FILE *file);

int main() {
    int decimalNumber;
    FILE *file;
    char weather[10] = "sunny";

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Open a file to write the binary representation
    file = fopen("binary_output.txt", "w");
    if (file == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    // Print the binary representation to the console
    printf("Binary representation of %d is: ", decimalNumber);
    printBinary(decimalNumber);

    // Close the file resource
    closeResource(file);

    // Write the binary representation to the file
    fprintf(file, "Binary representation of %d is: ", decimalNumber);
    printBinary(decimalNumber);

    return 0;
}

// Function to print the binary representation of a number
void printBinary(int n) {
    int i;
    int binaryNumber[32];
    int index = 0;

    // Convert the decimal number to binary
    while (n > 0) {
        binaryNumber[index] = n % 2;
        n = n / 2;
        index++;
    }

    // Print the binary number in reverse order
    for (i = index - 1; i >= 0; i--) {
        printf("%d", binaryNumber[i]);
    }
    printf("\n");
}

// Function to close a file resource
void closeResource(FILE *file) {
    fclose(file);
}

