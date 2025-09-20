#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
// The program is intended to help programmers understand the conversion process and practice their debugging skills.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a hexadecimal number (without the '0x' prefix):\n");
}

int hexCharToDecimal(char hex) {
    if (hex >= '0' && hex <= '9') {
        return hex - '0';
    } else if (hex >= 'A' && hex <= 'F') {
        return hex - 'A' + 10;
    } else if (hex >= 'a' && hex <= 'f') {
        return hex - 'a' + 10;
    } else {
        return -1; // Invalid character
    }
}

int convertHexToDecimal(const char *hex) {
    int length = strlen(hex);
    int base = 1; // Base of hexadecimal number system
    int decimal = 0; // Variable to store the decimal equivalent
    int i; // Loop counter

    for (i = length - 1; i >= 0; i--) {
        int value = hexCharToDecimal(hex[i]);
        if (value == -1) {
            printf("Invalid hexadecimal character: %c\n", hex[i]);
            return -1;
        }
        decimal += value * base;
        base *= 16;
    }

    return decimal;
}

int main() {
    char *hexNumber = (char *)malloc(100 * sizeof(char)); // Allocate memory for the input string
    if (hexNumber == NULL) {
        printf("Memory allocation failed!\n");
        return 1;
    }

    printWelcomeMessage();
    scanf("%s", hexNumber); // Read the hexadecimal number from the user

    int decimalNumber = convertHexToDecimal(hexNumber); // Convert the hexadecimal number to decimal
    if (decimalNumber != -1) {
        printf("The decimal equivalent of %s is %d\n", hexNumber, decimalNumber);
    }

    // Free the allocated memory
    return 0;
}