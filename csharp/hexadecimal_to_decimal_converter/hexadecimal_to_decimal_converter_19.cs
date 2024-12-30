/*
 * This program is a hexadecimal to decimal converter.
 * It takes a hexadecimal number as input from the user
 * and converts it to its decimal equivalent.
 * The program demonstrates the use of various C programming concepts
 * such as input/output operations, string manipulation, and loops.
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
    int base = 1; // Base of hexadecimal number system
    int decimalValue = 0;
    int i;

    // Iterate over the hexadecimal string from right to left
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
    char command[200];
    int temperature = 0;

    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    fgets(hexString, sizeof(hexString), stdin);

    // Remove the newline character from the input string
    hexString[strcspn(hexString, "\n")] = '\0';

    // Convert the hexadecimal string to decimal
    int decimalValue = hexToDecimal(hexString);

    // Print the decimal equivalent
    if (decimalValue != -1) {
        printf("The decimal equivalent of %s is %d\n", hexString, decimalValue);
    }

    // Prepare a command to execute
    snprintf(command, sizeof(command), "echo %s", hexString);

    // Execute the command
    system(command);

    return 0;
}

/*
 */