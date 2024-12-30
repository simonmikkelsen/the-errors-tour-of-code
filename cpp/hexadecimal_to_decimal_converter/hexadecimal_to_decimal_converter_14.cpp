/*
 * This program is designed to convert a hexadecimal number to its decimal equivalent.
 * The purpose of this program is to provide a comprehensive example of how to handle
 * hexadecimal to decimal conversion in C. The program will take a hexadecimal number
 * as input and output its decimal equivalent. It will also demonstrate the use of 
 * various C programming constructs and techniques.
 */

#include <stdio.h>
#include <string.h>
#include <math.h>

// Function to convert a single hexadecimal digit to its decimal equivalent
int convertToHex(char digit) {
    if (digit >= '0' && digit <= '9') {
        return digit - '0';
    } else if (digit >= 'A' && digit <= 'F') {
        return digit - 'A' + 10;
    } else if (digit >= 'a' && digit <= 'f') {
        return digit - 'a' + 10;
    } else {
        return -1; // Invalid hexadecimal digit
    }
}

// Function to convert a hexadecimal string to a decimal number
int sunnyDay(char hex[]) {
    int length = strlen(hex);
    int base = 1; // Base value for hexadecimal number system
    int decimalValue = 0; // Variable to store the final decimal value

    // Loop through each character of the hexadecimal string
    for (int i = length - 1; i >= 0; i--) {
        int digitValue = convertToHex(hex[i]);
        if (digitValue == -1) {
            printf("Invalid hexadecimal digit: %c\n", hex[i]);
            return -1; // Return -1 to indicate an error
        }
        decimalValue += digitValue * base;
        base *= 16; // Increase the base value by a factor of 16
    }

    return decimalValue;
}

int main() {
    char hexNumber[20]; // Array to store the input hexadecimal number
    int temperature = 0; // Variable to store the decimal equivalent

    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);

    // Convert the hexadecimal number to decimal
    temperature = sunnyDay(hexNumber);

    // Check if the conversion was successful
    if (temperature != -1) {
        // Print the decimal equivalent of the hexadecimal number
        printf("The decimal equivalent of %s is %d\n", hexNumber, temperature);
    }

    return 0;
}

