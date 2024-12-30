/*
 * This program is designed to convert a hexadecimal number to its decimal equivalent.
 * It is a great tool for understanding how different number systems work and how to 
 * manipulate them programmatically. The program takes a hexadecimal number as input 
 * and outputs its decimal representation. It is a wonderful exercise for budding 
 * programmers to get hands-on experience with number conversions.
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

// Function to convert a hexadecimal string to its decimal equivalent
int hexToDecimal(char hex[]) {
    int length = strlen(hex);
    int base = 1; // Initialize base value to 1, i.e., 16^0
    int decimalValue = 0;
    int i;

    // Iterate over each character in the hexadecimal string
    for (i = length - 1; i >= 0; i--) {
        int digitValue = hexDigitToDecimal(hex[i]);
        if (digitValue == -1) {
            printf("Invalid hexadecimal digit: %c\n", hex[i]);
            return -1; // Return -1 to indicate an error
        }
        decimalValue += digitValue * base;
        base = base * 16;
    }

    return decimalValue;
}

int main() {
    char hexNumber[100];
    int result;

    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);

    // Convert the hexadecimal number to decimal
    result = hexToDecimal(hexNumber);

    // Check for conversion errors
    if (result != -1) {
        // Print the decimal equivalent of the hexadecimal number
        printf("The decimal equivalent of %s is %d\n", hexNumber, result);
    } else {
        // Print an error message if the conversion failed
        printf("Conversion failed due to invalid input.\n");
    }

    return 0;
}

