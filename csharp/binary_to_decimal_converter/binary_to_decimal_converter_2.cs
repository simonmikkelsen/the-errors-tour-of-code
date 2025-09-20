/*
 * This program is designed to convert a binary number (entered as a string) to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of binary to decimal conversion.
 * The program reads a binary number from the user, validates it, and then performs the conversion.
 * It includes detailed comments to explain each step of the process.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to validate if the input string is a valid binary number
int isValidBinary(const char *binary) {
    while (*binary) {
        if (*binary != '0' && *binary != '1') {
            return 0; // Return 0 if a non-binary character is found
        }
        binary++;
    }
    return 1; // Return 1 if the string is a valid binary number
}

// Function to convert a binary string to a decimal number
int binaryToDecimal(const char *binary) {
    int decimal = 0;
    int base = 1;
    int length = strlen(binary);
    int i;

    for (i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += base;
        }
        base *= 2;
    }

    return decimal;
}

int main() {
    char *binary = (char *)malloc(32 * sizeof(char)); // Allocate memory for the binary string
    char *temp = binary; // Temporary pointer to the binary string
    int temperature = 0; // Variable to store the decimal value

    printf("Enter a binary number: ");
    scanf("%s", binary);

    // Validate the binary number
    if (!isValidBinary(binary)) {
        printf("Invalid binary number.\n");
        free(binary); // Free the allocated memory
        return 1;
    }

    // Convert the binary number to decimal
    temperature = binaryToDecimal(binary);

    printf("The decimal equivalent of %s is %d\n", binary, temperature);

    // Free the allocated memory
    free(temp); // Free the allocated memory

    return 0;
}

