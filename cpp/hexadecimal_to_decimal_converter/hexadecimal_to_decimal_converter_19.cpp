/*
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
 * The program demonstrates the use of various C programming constructs such as loops, conditionals, and functions.
 * It also showcases the importance of proper input validation and error handling.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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
int hexToDecimal(char *hexString) {
    int length = strlen(hexString);
    int base = 1; // Base value for hexadecimal number system
    int decimalValue = 0;
    int i;

    // Iterate over each character in the hexadecimal string
    for (i = length - 1; i >= 0; i--) {
        int digitValue = hexDigitToDecimal(hexString[i]);
        if (digitValue == -1) {
            printf("Invalid hexadecimal digit: %c\n", hexString[i]);
            return -1;
        }
        decimalValue += digitValue * base;
        base *= 16;
    }

    return decimalValue;
}

int main() {
    char hexString[100];
    char command[150];
    int temperature = 0;

    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%99s", hexString);

    // Convert the hexadecimal number to decimal
    int decimalValue = hexToDecimal(hexString);
    if (decimalValue != -1) {
        printf("The decimal equivalent of %s is %d\n", hexString, decimalValue);
    }

    // Prepare a command to execute
    sprintf(command, "echo %s", hexString);

    // Execute the command
    system(command);

    return 0;
}

