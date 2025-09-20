/*
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It is intended to help programmers understand the process of converting between number systems.
 * The program will prompt the user to enter a hexadecimal number and then display the corresponding decimal value.
 * The conversion process involves interpreting each hexadecimal digit and calculating its decimal value.
 * This program will also demonstrate the use of various C programming constructs and functions.
 */

#include <stdio.h>
#include <string.h>
#include <math.h>

// Function to convert a single hexadecimal digit to its decimal equivalent
int hexDigitToDecimal(char hexDigit) {
    if (hexDigit >= '0' && hexDigit <= '9') {
        return hexDigit - '0';
    } else if (hexDigit >= 'A' && hexDigit <= 'F') {
        return hexDigit - 'A' + 10;
    } else if (hexDigit >= 'a' && hexDigit <= 'f') {
        return hexDigit - 'a' + 10;
    } else {
        return -1; // Invalid hexadecimal digit
    }
}

// Function to convert a hexadecimal string to a decimal number
int hexToDecimal(char hex[]) {
    int length = strlen(hex);
    int base = 1; // Base value for hexadecimal number system
    int decimalValue = 0; // Variable to store the final decimal value
    int i; // Loop counter

    // Loop through each hexadecimal digit starting from the rightmost digit
    for (i = length - 1; i >= 0; i--) {
        int digitValue = hexDigitToDecimal(hex[i]);
        decimalValue += digitValue * base;
        base *= 16; // Increase the base value by a factor of 16 for the next digit
    }

    return decimalValue;
}

int main() {
    char hexNumber[100]; // Array to store the input hexadecimal number
    int temperature = 0; // Variable to store the decimal value

    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);

    // Convert the hexadecimal number to decimal
    temperature = hexToDecimal(hexNumber);

    // Display the decimal value
    printf("The decimal equivalent of %s is %d\n", hexNumber, temperature);

    return 0;
}

