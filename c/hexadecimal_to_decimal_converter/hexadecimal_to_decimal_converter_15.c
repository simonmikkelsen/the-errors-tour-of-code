#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number (base 16) to a decimal number (base 10).
// Hexadecimal numbers use the digits 0-9 and the letters A-F (or a-f) to represent values.
// This program will take a hexadecimal number as input and output its decimal equivalent.
// The program will handle both uppercase and lowercase hexadecimal digits.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a hexadecimal number (use digits 0-9 and letters A-F or a-f):\n");
}

int hexCharToDecimal(char c) {
    // This function converts a single hexadecimal character to its decimal equivalent.
    // If the character is a digit (0-9), it returns the corresponding integer value.
    // If the character is a letter (A-F or a-f), it returns the corresponding value (10-15).
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

unsigned short convertHexToDecimal(const char* hex) {
    // This function converts a hexadecimal string to its decimal equivalent.
    // It iterates over each character in the string, converts it to its decimal value,
    // and accumulates the result using the appropriate power of 16.
    unsigned short decimal = 0;
    int length = strlen(hex);
    for (int i = 0; i < length; i++) {
        int value = hexCharToDecimal(hex[i]);
        if (value == -1) {
            printf("Invalid hexadecimal character: %c\n", hex[i]);
            return 0;
        }
        decimal += value * pow(16, length - 1 - i);
    }
    return decimal;
}

int main() {
    // The main function serves as the entry point of the program.
    // It prints a welcome message, reads the user's input, and calls the conversion function.
    char hex[20];
    printWelcomeMessage();
    scanf("%19s", hex);
    unsigned short decimal = convertHexToDecimal(hex);
    printf("The decimal equivalent of %s is %u\n", hex, decimal);
    return 0;
}

