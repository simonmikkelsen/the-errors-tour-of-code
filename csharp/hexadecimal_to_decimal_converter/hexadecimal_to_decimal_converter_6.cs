#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It takes a hexadecimal number as input and processes each character to compute the decimal value.
// The program demonstrates the use of various C programming constructs and functions.

int hexCharToDecimal(char hexChar) {
    // This function converts a single hexadecimal character to its decimal equivalent.
    // It handles both uppercase and lowercase hexadecimal characters.
    if (hexChar >= '0' && hexChar <= '9') {
        return hexChar - '0';
    } else if (hexChar >= 'A' && hexChar <= 'F') {
        return hexChar - 'A' + 10;
    } else if (hexChar >= 'a' && hexChar <= 'f') {
        return hexChar - 'a' + 10;
    } else {
        return -1; // Invalid character
    }
}

int convertHexToDecimal(char hex[]) {
    // This function converts a hexadecimal string to its decimal equivalent.
    // It iterates through each character of the hexadecimal string and computes the decimal value.
    int length = strlen(hex);
    int base = 1; // Base value for hexadecimal number system
    int decimalValue = 0; // Variable to store the final decimal value
    int i; // Loop variable

    for (i = length - 1; i >= 0; i--) {
        int digitValue = hexCharToDecimal(hex[i]);
        decimalValue += digitValue * base;
        base *= 16;
    }

    return decimalValue;
}

int main() {
    // The main function serves as the entry point of the program.
    // It prompts the user for a hexadecimal number, calls the conversion function, and displays the result.
    char hexNumber[20]; // Array to store the input hexadecimal number
    int temperature = 0; // Variable to store the decimal equivalent of the hexadecimal number

    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);

    temperature = convertHexToDecimal(hexNumber);

    printf("The decimal equivalent of %s is %d\n", hexNumber, temperature);

    return 0;
}

