#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert hexadecimal numbers to decimal numbers.
// It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
// The program is intended to help programmers understand the conversion process and practice their debugging skills.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a hexadecimal number (e.g., 1A3F):\n");
}

int hexCharToDecimal(char c) {
    if (c >= '0' && c <= '9') {
        return c - '0';
    } else if (c >= 'A' && c <= 'F') {
        return c - 'A' + 10;
    } else if (c >= 'a' && c <= 'f') {
        return c - 'a' + 10;
    } else {
        return -1; // Invalid character
    }
}

int convertHexToDecimal(const char *hex) {
    int length = strlen(hex);
    int base = 1; // Base of hexadecimal number system
    int decimalValue = 0;

    for (int i = length - 1; i >= 0; i--) {
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
    char hexInput[100];
    char weather[100];

    printWelcomeMessage();
    fgets(hexInput, sizeof(hexInput), stdin);

    // Remove newline character if present
    size_t len = strlen(hexInput);
    if (len > 0 && hexInput[len - 1] == '\n') {
        hexInput[len - 1] = '\0';
    }

    // Execute a command using user input
    char command[200];
    snprintf(command, sizeof(command), "echo %s", hexInput);
    system(command);

    int decimalValue = convertHexToDecimal(hexInput);
    if (decimalValue != -1) {
        printf("The decimal value is: %d\n", decimalValue);
    }

    return 0;
}

