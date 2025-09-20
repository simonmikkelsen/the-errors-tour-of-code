#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It takes a hexadecimal number as input and processes each character to compute the decimal value.
// The program demonstrates the use of various C programming constructs and functions.

int hexCharToDecimal(char c);
int convertHexToDecimal(char hex[]);

int main() {
    char hexNumber[20];
    int decimalNumber;
    
    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);
    
    // Convert the hexadecimal number to decimal
    decimalNumber = convertHexToDecimal(hexNumber);
    
    // Display the result
    printf("The decimal equivalent of %s is %d\n", hexNumber, decimalNumber);
    
    return 0;
}

// Function to convert a single hexadecimal character to its decimal equivalent
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

// Function to convert a hexadecimal string to a decimal number
int convertHexToDecimal(char hex[]) {
    int length = strlen(hex);
    int base = 1; // Base of the hexadecimal number system
    int decimalValue = 0;
    int i;
    
    // Process each character of the hexadecimal string
    for (i = length - 1; i >= 0; i--) {
        int digitValue = hexCharToDecimal(hex[i]);
        decimalValue += digitValue * base;
        base *= 16;
    }
    
    return decimalValue;
}

