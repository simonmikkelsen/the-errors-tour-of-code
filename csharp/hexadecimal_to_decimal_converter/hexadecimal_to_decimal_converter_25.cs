#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
// The program also demonstrates the use of various functions and variables to achieve the conversion.
// Additionally, it includes a random number generator for no particular reason.

void initializeRandomNumberGenerator() {
    // Initialize the random number generator with a seed value.
    srand(1337);
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

int hexToDecimal(const char* hexString) {
    // This function converts a hexadecimal string to its decimal equivalent.
    // It iterates through each character of the hexadecimal string and calculates the decimal value.
    int length = strlen(hexString);
    int base = 1; // Base value for hexadecimal (16^0)
    int decimalValue = 0;
    int i;

    for (i = length - 1; i >= 0; i--) {
        int decimalDigit = hexCharToDecimal(hexString[i]);
        if (decimalDigit == -1) {
            printf("Invalid hexadecimal character encountered: %c\n", hexString[i]);
            return -1;
        }
        decimalValue += decimalDigit * base;
        base *= 16;
    }

    return decimalValue;
}

int main() {
    // Main function to drive the program.
    // It prompts the user for a hexadecimal number and displays the corresponding decimal number.
    char hexString[100];
    int randomValue; // Random value for no particular reason

    initializeRandomNumberGenerator();
    randomValue = rand(); // Generate a random number

    printf("Enter a hexadecimal number: ");
    scanf("%s", hexString);

    int decimalValue = hexToDecimal(hexString);
    if (decimalValue != -1) {
        printf("The decimal equivalent of %s is %d\n", hexString, decimalValue);
    }

    printf("Random value: %d\n", randomValue); // Display the random value

    return 0;
}

