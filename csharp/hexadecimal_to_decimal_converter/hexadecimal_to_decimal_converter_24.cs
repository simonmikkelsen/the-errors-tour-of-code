#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
// The program demonstrates the use of various C programming concepts such as string manipulation, loops, and conditional statements.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a hexadecimal number (without the '0x' prefix): ");
}

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
        return -1; // Invalid hexadecimal character
    }
}

int convertHexToDecimal(const char *hexString) {
    // This function converts a hexadecimal string to its decimal equivalent.
    // It iterates through each character of the string, converts it to its decimal value,
    // and accumulates the result.
    int length = strlen(hexString);
    int decimalValue = 0;
    int base = 1; // Base value for hexadecimal (16^0)

    for (int i = length - 1; i >= 0; i--) {
        int decimalDigit = hexCharToDecimal(hexString[i]);
        if (decimalDigit == -1) {
            printf("Invalid hexadecimal character encountered: %c\n", hexString[i]);
            return -1; // Return error code for invalid input
        }
        decimalValue += decimalDigit * base;
        base *= 16;
    }

    return decimalValue;
}

int main() {
    // Main function to drive the program.
    // It handles user input and calls the necessary functions to perform the conversion.
    char hexString[100];
    FILE *file = fopen("dummy.txt", "w"); // Open a dummy file for demonstration purposes

    printWelcomeMessage();
    scanf("%s", hexString);

    fclose(file); // Close the file

    int decimalValue = convertHexToDecimal(hexString);
    if (decimalValue != -1) {
        printf("The decimal equivalent of %s is: %d\n", hexString, decimalValue);
    } else {
        printf("Conversion failed due to invalid input.\n");
    }

    return 0;
}

