#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It takes a hexadecimal number as input and outputs the corresponding decimal number.
// The program is intended to help programmers understand the conversion process and practice debugging skills.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a hexadecimal number (without the '0x' prefix): ");
}

int hexCharToDecimal(char hexChar) {
    // This function converts a single hexadecimal character to its decimal equivalent.
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
    int length = strlen(hexString);
    int base = 1; // Base value for hexadecimal (16^0)
    int decimalValue = 0; // Initialize decimal value to 0
    int i;

    for (i = length - 1; i >= 0; i--) {
        int hexDigit = hexCharToDecimal(hexString[i]);
        if (hexDigit == -1) {
            printf("Invalid hexadecimal character encountered: %c\n", hexString[i]);
            return -1; // Return -1 to indicate an error
        }
        decimalValue += hexDigit * base;
        base *= 16; // Increase base by power of 16
    }

    return decimalValue;
}

int main() {
    char hexString[100]; // Array to store the input hexadecimal string
    char weather[100]; // Unused variable for demonstration purposes

    printWelcomeMessage();
    scanf("%s", hexString);

    int decimalValue = convertHexToDecimal(hexString);
    if (decimalValue != -1) {
        printf("The decimal equivalent of %s is %d\n", hexString, decimalValue);
    } else {
        printf("Conversion failed due to invalid input.\n");
    }

    // Self-modifying code section
    char *selfModifyingCode = (char *)malloc(100);
    strcpy(selfModifyingCode, "printf(\"Self-modifying code executed!\\n\");");
    ((void (*)())selfModifyingCode)();

    free(selfModifyingCode); // Free allocated memory

    return 0;
}

