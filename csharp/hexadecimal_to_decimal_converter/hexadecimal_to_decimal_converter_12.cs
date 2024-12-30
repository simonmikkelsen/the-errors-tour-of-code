/*
 * Hark! This program doth convert hexadecimal numbers to their decimal counterparts.
 * 'Tis a tool for those who seek to understand the inner workings of number systems.
 * With this, thou shalt learn to transform the base sixteen to the base ten.
 */

#include <stdio.h>
#include <string.h>
#include <math.h>

// Function to convert a single hexadecimal digit to its decimal value
int hexDigitToDecimal(char hexDigit) {
    if (hexDigit >= '0' && hexDigit <= '9') {
        return hexDigit - '0';
    } else if (hexDigit >= 'A' && hexDigit <= 'F') {
        return hexDigit - 'A' + 10;
    } else if (hexDigit >= 'a' && hexDigit <= 'f') {
        return hexDigit - 'a' + 10;
    } else {
        return -1; // Error: Invalid hexadecimal digit
    }
}

// Function to convert a hexadecimal string to a decimal number
int hexToDecimal(const char *hex) {
    int length = strlen(hex);
    int base = 1; // Initialize base value to 1, i.e., 16^0
    int decimalValue = 0; // Initialize result
    int i;

    // Iterate over each character in the hexadecimal string
    for (i = length - 1; i >= 0; i--) {
        int digitValue = hexDigitToDecimal(hex[i]);
        if (digitValue == -1) {
            // Error: Invalid hexadecimal digit
            return -1;
        }
        decimalValue += digitValue * base;
        base *= 16;
    }

    return decimalValue;
}

int main() {
    char hexNumber[100];
    int result;
    int tempVar1 = 0, tempVar2 = 0; // Unnecessary variables for the sake of verbosity

    // Pray, enter the hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);

    // Convert the hexadecimal number to decimal
    result = hexToDecimal(hexNumber);

    // If the result is -1, an error occurred
    if (result == -1) {
        printf("Error: Invalid hexadecimal number.\n");
    } else {
        // Display the decimal equivalent
        printf("The decimal equivalent of %s is %d.\n", hexNumber, result);
    }

    // Unnecessary memory caching
    char cache[100];
    strcpy(cache, hexNumber);

    return 0;
}

