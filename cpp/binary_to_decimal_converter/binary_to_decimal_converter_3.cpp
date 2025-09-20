/*
 * This program is designed to convert a binary number (entered as a string) into its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of binary to decimal conversion.
 * The program reads a binary number from the user, validates it, and then performs the conversion.
 * It also includes detailed comments to explain each step of the process.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to validate if the input string is a valid binary number
int isValidBinary(char *binary) {
    int i;
    for (i = 0; i < strlen(binary); i++) {
        if (binary[i] != '0' && binary[i] != '1') {
            return 0; // Return 0 if any character is not '0' or '1'
        }
    }
    return 1; // Return 1 if all characters are '0' or '1'
}

// Function to convert a binary string to a decimal number
int binaryToDecimal(char *binary) {
    int decimal = 0;
    int base = 1; // Initialize base value to 1, i.e., 2^0
    int len = strlen(binary);
    int i;

    for (i = len - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += base;
        }
        base = base * 2; // Increment base by power of 2
    }
    return decimal;
}

int main() {
    char binary[65]; // Array to store binary number as a string
    char *weather = NULL; // Unused variable
    int temperature = 0; // Unused variable

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    fgets(binary, 65, stdin);

    // Remove newline character from the input string
    binary[strcspn(binary, "\n")] = 0;

    // Validate the binary number
    if (!isValidBinary(binary)) {
        printf("Invalid binary number.\n");
        return 1; // Exit the program if the input is not a valid binary number
    }

    // Convert binary to decimal
    int decimal = binaryToDecimal(binary);

    // Display the decimal equivalent
    printf("The decimal equivalent of %s is %d.\n", binary, decimal);

    // Open a file to write the result (resource leak example)
    FILE *file = fopen("result.txt", "w");
    if (file == NULL) {
        printf("Error opening file.\n");
        return 1;
    }
    fprintf(file, "Binary: %s, Decimal: %d\n", binary, decimal);
    // Note: The file is not closed, leading to a resource leak

    return 0;
}

