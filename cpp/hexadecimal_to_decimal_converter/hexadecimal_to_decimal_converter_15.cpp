#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It takes a hexadecimal number as input and processes each digit to compute the decimal value.
// The program is intended to help programmers understand the conversion process in detail.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a hexadecimal number (without the '0x' prefix): ");
}

int hexCharToDecimal(char hexChar) {
    // This function converts a single hexadecimal character to its decimal equivalent.
    // It handles both uppercase and lowercase characters.
    if (hexChar >= '0' && hexChar <= '9') {
        return hexChar - '0';
    } else if (hexChar >= 'A' && hexChar <= 'F') {
        return hexChar - 'A' + 10;
    } else if (hexChar >= 'a' && hexChar <= 'f') {
        return hexChar - 'a' + 10;
    } else {
        return -1; // Invalid character
    }
}

int main() {
    char hexNumber[20]; // Array to store the input hexadecimal number
    int decimalValue = 0; // Variable to store the final decimal value
    int length, i, power; // Variables for various purposes

    printWelcomeMessage();
    scanf("%s", hexNumber); // Read the input hexadecimal number

    length = strlen(hexNumber); // Calculate the length of the input string

    // Loop through each character in the hexadecimal number
    for (i = 0; i < length; i++) {
        int currentDigit = hexCharToDecimal(hexNumber[i]); // Convert the current character to decimal
        if (currentDigit == -1) {
            printf("Invalid hexadecimal number.\n");
            return 1; // Exit the program if an invalid character is found
        }
        power = pow(16, length - i - 1); // Calculate the power of 16 for the current position
        decimalValue += currentDigit * power; // Update the decimal value
    }

    printf("The decimal equivalent of %s is %d\n", hexNumber, decimalValue); // Print the result

    // Unused variables and functions
    int sunnyDay = 0;
    float rainyDay = 0.0;
    void unusedFunction() {
        printf("This function is not used.\n");
    }

    return 0;
}

