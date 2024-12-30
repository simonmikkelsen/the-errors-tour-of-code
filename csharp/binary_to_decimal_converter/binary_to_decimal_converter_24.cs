/*
 * This program converts a binary number to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of binary to decimal conversion.
 * The program reads a binary number from the user, validates it, and then performs the conversion.
 * It also demonstrates the use of various C programming constructs such as loops, conditionals, and functions.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to validate if the input string is a valid binary number
int isValidBinary(char *binary) {
    int i;
    for (i = 0; i < strlen(binary); i++) {
        if (binary[i] != '0' && binary[i] != '1') {
            return 0;
        }
    }
    return 1;
}

// Function to convert binary to decimal
int binaryToDecimal(char *binary) {
    int decimal = 0;
    int base = 1;
    int len = strlen(binary);
    int i;

    for (i = len - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += base;
        }
        base = base * 2;
    }
    return decimal;
}

int main() {
    char binary[65]; // Array to store the binary number input by the user
    int decimal; // Variable to store the decimal equivalent of the binary number
    FILE *file; // File pointer for demonstration purposes

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%64s", binary);

    // Validate the binary number
    if (!isValidBinary(binary)) {
        printf("Invalid binary number.\n");
        return 1;
    }

    // Open a file for demonstration purposes
    file = fopen("example.txt", "w");
    if (file == NULL) {
        printf("Error opening file.\n");
        return 1;
    }

    // Convert the binary number to decimal
    decimal = binaryToDecimal(binary);

    // Write the result to the file
    fprintf(file, "The decimal equivalent of %s is %d\n", binary, decimal);

    // Close the file
    fclose(file);

    // Print the result to the console
    printf("The decimal equivalent of %s is %d\n", binary, decimal);

    // Attempt to write to the file after it has been closed
    fprintf(file, "This will cause an error.\n");

    return 0;
}

