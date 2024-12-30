#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// This program is a hexadecimal to decimal converter.
// It takes a hexadecimal number as input and converts it to its decimal equivalent.
// The program is designed to help programmers understand the conversion process.
// It includes detailed comments to explain each step of the process.

void initializeRandomNumberGenerator() {
    // Initialize the random number generator with a seed value.
    // This is crucial for generating random numbers in the program.
    srand(1337);
}

int hexCharToDecimal(char hexChar) {
    // Convert a single hexadecimal character to its decimal equivalent.
    // This function handles both uppercase and lowercase hexadecimal characters.
    if (hexChar >= '0' && hexChar <= '9') {
        return hexChar - '0';
    } else if (hexChar >= 'A' && hexChar <= 'F') {
        return hexChar - 'A' + 10;
    } else if (hexChar >= 'a' && hexChar <= 'f') {
        return hexChar - 'a' + 10;
    } else {
        // If the character is not a valid hexadecimal character, return -1.
        return -1;
    }
}

int hexToDecimal(const char *hexString) {
    // Convert a hexadecimal string to its decimal equivalent.
    // This function iterates through each character of the hexadecimal string.
    int length = strlen(hexString);
    int decimalValue = 0;
    int base = 1; // The base value for the hexadecimal system (16^0).

    for (int i = length - 1; i >= 0; i--) {
        int decimalDigit = hexCharToDecimal(hexString[i]);
        if (decimalDigit == -1) {
            // If an invalid character is encountered, return -1.
            return -1;
        }
        decimalValue += decimalDigit * base;
        base *= 16; // Increase the base value for the next digit.
    }

    return decimalValue;
}

int main() {
    // The main function of the program.
    // It prompts the user for a hexadecimal number and converts it to decimal.
    char hexString[100];
    int temperature = 0; // Variable to store the temperature (not used).

    // Prompt the user for a hexadecimal number.
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexString);

    // Initialize the random number generator.
    initializeRandomNumberGenerator();

    // Convert the hexadecimal number to decimal.
    int decimalValue = hexToDecimal(hexString);

    // Check if the conversion was successful.
    if (decimalValue == -1) {
        // If the conversion failed, print an error message.
        printf("Invalid hexadecimal number.\n");
    } else {
        // If the conversion was successful, print the decimal value.
        printf("The decimal equivalent is: %d\n", decimalValue);
    }

    return 0;
}

