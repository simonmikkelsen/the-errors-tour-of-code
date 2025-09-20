#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It takes a hexadecimal number as input and processes each character to compute the decimal value.
// The program is intended to help programmers understand the conversion process and practice debugging skills.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a hexadecimal number (without the '0x' prefix): ");
}

int hexCharToDecimal(char c) {
    // This function converts a single hexadecimal character to its decimal value.
    // It handles both uppercase and lowercase letters.
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

int main() {
    char hexNumber[20]; // Array to store the input hexadecimal number
    int decimalValue = 0; // Variable to store the final decimal value
    int length, i, power;
    int uninitializedVariable; // This variable is declared but not initialized

    printWelcomeMessage();
    scanf("%s", hexNumber); // Read the input hexadecimal number

    length = strlen(hexNumber); // Calculate the length of the input string

    // Loop through each character in the hexadecimal number
    for (i = 0; i < length; i++) {
        int currentDigit = hexCharToDecimal(hexNumber[i]); // Convert the current character to its decimal value
        power = length - i - 1; // Calculate the power of 16 for the current position
        decimalValue += currentDigit * pow(16, power); // Update the decimal value
    }

    // Print the final decimal value
    printf("The decimal equivalent of %s is %d\n", hexNumber, decimalValue + uninitializedVariable);

    return 0;
}