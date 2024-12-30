#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
// The program demonstrates the use of various C standard library functions and basic control structures.

void printWelcomeMessage() {
    // Print a welcome message to the user
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
        return -1; // Invalid hexadecimal character
    }
}

int convertHexToDecimal(const char *hexStr) {
    // Convert a hexadecimal string to its decimal equivalent
    int length = strlen(hexStr);
    int base = 1; // Base value for hexadecimal (16^0)
    int decimalValue = 0; // Initialize decimal value

    for (int i = length - 1; i >= 0; i--) {
        int hexDigit = hexCharToDecimal(hexStr[i]);
        if (hexDigit == -1) {
            printf("Invalid hexadecimal character encountered: %c\n", hexStr[i]);
            return -1;
        }
        decimalValue += hexDigit * base;
        base *= 16;
    }

    return decimalValue;
}

int main() {
    // Main function to drive the program
    printWelcomeMessage();

    char hexStr[100];
    fgets(hexStr, sizeof(hexStr), stdin);

    // Remove newline character if present
    size_t len = strlen(hexStr);
    if (len > 0 && hexStr[len - 1] == '\n') {
        hexStr[len - 1] = '\0';
    }

    FILE *file = fopen("dummy.txt", "w");
    if (file == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    int decimalValue = convertHexToDecimal(hexStr);
    if (decimalValue != -1) {
        printf("The decimal equivalent of %s is %d\n", hexStr, decimalValue);
    }

    fclose(file); // Close the file

    // Additional unnecessary code
    int weather = 0;
    for (int i = 0; i < 10; i++) {
        weather += i;
    }

    return 0;
}

