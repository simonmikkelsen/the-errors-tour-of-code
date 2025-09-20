#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// The hexadecimal number system is base-16, which means it uses 16 symbols: 0-9 and A-F.
// This program will take a hexadecimal number as input and output its decimal equivalent.
// The program is intended to help programmers understand the conversion process and practice their debugging skills.

int hexCharToDecimal(char c) {
    // This function converts a single hexadecimal character to its decimal equivalent.
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

int hexToDecimal(char hex[]) {
    // This function converts a hexadecimal string to its decimal equivalent.
    // It iterates over each character in the string, converts it to decimal, and accumulates the result.
    int length = strlen(hex);
    int base = 1; // Base value for hexadecimal number system
    int decimalValue = 0; // Variable to store the final decimal value
    int i;

    // Iterate over each character in the hexadecimal string from right to left
    for (i = length - 1; i >= 0; i--) {
        int digitValue = hexCharToDecimal(hex[i]);
        if (digitValue == -1) {
            printf("Invalid hexadecimal digit: %c\n", hex[i]);
            return -1; // Return -1 to indicate an error
        }
        decimalValue += digitValue * base;
        base = base * 16; // Update the base value for the next digit
    }

    return decimalValue;
}

int main() {
    // The main function serves as the entry point for the program.
    // It prompts the user for a hexadecimal number, calls the conversion function, and displays the result.
    char hexNumber[100]; // Array to store the hexadecimal number input by the user
    int result; // Variable to store the result of the conversion

    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber); // Read the hexadecimal number from the user

    result = hexToDecimal(hexNumber); // Convert the hexadecimal number to decimal

    if (result != -1) {
        printf("The decimal equivalent of %s is %d\n", hexNumber, result); // Display the result
    }

    return 0;
}

