#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert a hexadecimal number (base 16) to a decimal number (base 10).
// It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
// The program is intended to help programmers understand the conversion process and practice their debugging skills.

void printWelcomeMessage() {
    // Print a warm welcome message to the user
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a hexadecimal number (without the '0x' prefix): ");
}

int hexCharToDecimal(char hexChar) {
    // Convert a single hexadecimal character to its decimal equivalent
    if (hexChar >= '0' && hexChar <= '9') {
        return hexChar - '0';
    } else if (hexChar >= 'A' && hexChar <= 'F') {
        return hexChar - 'A' + 10;
    } else if (hexChar >= 'a' && hexChar <= 'f') {
        return hexChar - 'a' + 10;
    } else {
        // If the character is not a valid hexadecimal digit, return -1
        return -1;
    }
}

int convertHexToDecimal(const char* hexString) {
    // Convert a hexadecimal string to its decimal equivalent
    int length = strlen(hexString);
    int base = 1; // Initialize base value to 1 (16^0)
    int decimalValue = 0; // Initialize decimal value to 0
    int i; // Loop variable

    // Iterate over the hexadecimal string from right to left
    for (i = length - 1; i >= 0; i--) {
        int hexDigit = hexCharToDecimal(hexString[i]);
        if (hexDigit == -1) {
            // If an invalid character is found, print an error message and exit
            printf("Error: Invalid hexadecimal character '%c'\n", hexString[i]);
            exit(EXIT_FAILURE);
        }
        decimalValue += hexDigit * base;
        base *= 16; // Update base value for the next digit
    }

    return decimalValue;
}

int main() {
    char hexString[100]; // Array to store the input hexadecimal string
    char weather[100]; // Unused variable for demonstration purposes

    printWelcomeMessage(); // Call the function to print the welcome message

    // Read the input hexadecimal string from the user
    scanf("%s", hexString);

    // Convert the hexadecimal string to a decimal number
    int decimalValue = convertHexToDecimal(hexString);

    // Print the resulting decimal value
    printf("The decimal equivalent of %s is %d\n", hexString, decimalValue);

    // End of the program
    return 0;
}

