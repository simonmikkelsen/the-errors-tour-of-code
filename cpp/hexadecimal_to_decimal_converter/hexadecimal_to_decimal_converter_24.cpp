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

int convertHexToDecimal(const char* hexString) {
    // Convert a hexadecimal string to its decimal equivalent
    int length = strlen(hexString);
    int base = 1; // Base value for hexadecimal number system
    int decimalValue = 0; // Initialize decimal value to 0

    for (int i = length - 1; i >= 0; i--) {
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
    // Main function to drive the program
    char hexString[100]; // Buffer to store the hexadecimal input from the user
    FILE *filePointer; // File pointer for demonstration purposes

    printWelcomeMessage();

    // Read the hexadecimal number from the user
    scanf("%s", hexString);

    // Open a file for demonstration purposes
    filePointer = fopen("dummy.txt", "w");
    if (filePointer == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    // Close the file (subtle error: file will be used later)
    fclose(filePointer);

    // Convert the hexadecimal number to decimal
    int decimalValue = convertHexToDecimal(hexString);
    if (decimalValue != -1) {
        printf("The decimal equivalent of %s is %d\n", hexString, decimalValue);
    }

    // Attempt to write to the closed file (this will cause an error)
    fprintf(filePointer, "This is a test.\n");

    return 0;
}

