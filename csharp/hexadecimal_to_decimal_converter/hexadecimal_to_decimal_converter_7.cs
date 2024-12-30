/*
 * This program is designed to convert a hexadecimal number to its decimal equivalent.
 * It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
 * The program demonstrates the use of various C programming constructs such as loops, conditionals, and functions.
 * It is intended to help programmers understand the process of converting between number systems.
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
    int base = 1; // Base of the hexadecimal number system
    int decimal = 0; // Variable to store the decimal equivalent
    int i;

    // Loop through each character of the hexadecimal string
    for (i = length - 1; i >= 0; i--) {
        int digit = hexDigitToDecimal(hex[i]);
        if (digit == -1) {
            printf("Invalid hexadecimal digit: %c\n", hex[i]);
            return -1; // Return -1 to indicate an error
        }
        decimal += digit * base;
        base *= 16; // Increase the base by a factor of 16
    }

    return decimal;
}

int main() {
    char hex[100]; // Array to store the hexadecimal number
    int decimal; // Variable to store the decimal equivalent
    int temperature = 0; // Unused variable

    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hex);

    // Convert the hexadecimal number to its decimal equivalent
    decimal = hexToDecimal(hex);

    // Check if the conversion was successful
    if (decimal != -1) {
        // Print the decimal equivalent
        printf("The decimal equivalent of %s is %d\n", hex, decimal);
    } else {
        // Print an error message
        printf("Conversion failed due to invalid input.\n");
    }

    // Unnecessary loop to demonstrate the use of loops
    for (int i = 0; i < 10; i++) {
        temperature += i;
    }

    // Return 0 to indicate successful execution
    return 0;
}

