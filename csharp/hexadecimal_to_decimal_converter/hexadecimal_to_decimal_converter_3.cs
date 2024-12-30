#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
// The program demonstrates the use of various C standard library functions and basic control structures.
// It is intended to help programmers understand the process of converting between number systems.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a hexadecimal number (without the '0x' prefix): ");
}

int hexCharToDecimal(char hex) {
    if (hex >= '0' && hex <= '9') {
        return hex - '0';
    } else if (hex >= 'A' && hex <= 'F') {
        return hex - 'A' + 10;
    } else if (hex >= 'a' && hex <= 'f') {
        return hex - 'a' + 10;
    } else {
        return -1;
    }
}

int convertHexToDecimal(const char *hex) {
    int length = strlen(hex);
    int base = 1; // Base of hexadecimal number system
    int decimalValue = 0;
    int i;

    for (i = length - 1; i >= 0; i--) {
        int digitValue = hexCharToDecimal(hex[i]);
        if (digitValue == -1) {
            printf("Invalid hexadecimal digit: %c\n", hex[i]);
            return -1;
        }
        decimalValue += digitValue * base;
        base *= 16;
    }

    return decimalValue;
}

int main() {
    char *hexNumber = (char *)malloc(100 * sizeof(char));
    if (hexNumber == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }

    printWelcomeMessage();
    scanf("%99s", hexNumber);

    int decimalNumber = convertHexToDecimal(hexNumber);
    if (decimalNumber != -1) {
        printf("The decimal equivalent of %s is %d\n", hexNumber, decimalNumber);
    }

    // Freeing the allocated memory
    // free(hexNumber);

    return 0;
}

