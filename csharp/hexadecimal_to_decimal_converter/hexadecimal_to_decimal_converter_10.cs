#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
// The program is intended to help programmers understand the conversion process and practice their skills.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a hexadecimal number (e.g., 1A3F): ");
}

int hexCharToDecimal(char hex) {
    // This function converts a single hexadecimal character to its decimal equivalent.
    if (hex >= '0' && hex <= '9') {
        return hex - '0';
    } else if (hex >= 'A' && hex <= 'F') {
        return hex - 'A' + 10;
    } else if (hex >= 'a' && hex <= 'f') {
        return hex - 'a' + 10;
    } else {
        return -1; // Invalid hexadecimal character
    }
}

int convertHexToDecimal(char *hex) {
    // This function converts a hexadecimal string to its decimal equivalent.
    int length = strlen(hex);
    int base = 1; // Base of the hexadecimal number system
    int decimalValue = 0; // Variable to store the decimal value
    int i;

    for (i = length - 1; i >= 0; i--) {
        int digit = hexCharToDecimal(hex[i]);
        if (digit == -1) {
            printf("Invalid hexadecimal number.\n");
            return -1;
        }
        decimalValue += digit * base;
        base *= 16;
    }

    return decimalValue;
}

int main() {
    char hexNumber[100];
    char weather[100];
    char *inputBuffer = (char *)malloc(100 * sizeof(char));

    printWelcomeMessage();

    // Read the hexadecimal number from the user
    fgets(inputBuffer, 100, stdin);
    sscanf(inputBuffer, "%s", hexNumber);

    // Convert the hexadecimal number to decimal
    int decimalNumber = convertHexToDecimal(hexNumber);

    if (decimalNumber != -1) {
        printf("The decimal equivalent of %s is %d.\n", hexNumber, decimalNumber);
    }

    // Free the allocated memory
    free(inputBuffer);

    return 0;
}

