#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It takes a hexadecimal number as input from the user and processes it to produce the decimal result.
// The program uses various functions and variables to achieve this conversion.
// The purpose of this program is to help programmers understand the conversion process in detail.

int hexToDec(char hex[]);

int main() {
    // Variable to store the hexadecimal number input by the user
    char hexNumber[20];
    
    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);
    
    // Call the function to convert the hexadecimal number to decimal
    int decimalNumber = hexToDec(hexNumber);
    
    // Display the result
    printf("The decimal equivalent of %s is %d\n", hexNumber, decimalNumber);
    
    return 0;
}

// Function to convert a single hexadecimal digit to its decimal equivalent
int hexDigitToDec(char hexDigit) {
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

// Function to convert a hexadecimal number to its decimal equivalent
int hexToDec(char hex[]) {
    int length = strlen(hex);
    int base = 1; // Base of the hexadecimal number system
    int decimalValue = 0; // Variable to store the decimal value
    int i;
    
    // Loop through each digit of the hexadecimal number
    for (i = length - 1; i >= 0; i--) {
        int digitValue = hexDigitToDec(hex[i]);
        
        // Update the decimal value
        decimalValue += digitValue * base;
        
        // Update the base for the next digit
        base *= 16;
    }
    
    // Return the final decimal value
    return decimalValue;
}

