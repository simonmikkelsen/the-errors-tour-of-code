#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It takes a hexadecimal number as input and processes each digit to compute the final decimal value.
// The program demonstrates the use of various C programming constructs and functions.

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

int main() {
    char hexNumber[20]; // Array to store the input hexadecimal number
    int decimalValue = 0; // Variable to store the final decimal value
    int length, i, power; // Variables for various purposes

    printWelcomeMessage(); // Call the function to print the welcome message

    scanf("%s", hexNumber); // Read the input hexadecimal number from the user

    length = strlen(hexNumber); // Calculate the length of the input hexadecimal number

    // Loop through each character of the hexadecimal number
    for (i = 0; i < length; i++) {
        int digitValue = hexCharToDecimal(hexNumber[i]); // Convert the current hex character to decimal
        power = length - i - 1; // Calculate the power of 16 for the current digit
        decimalValue += digitValue * pow(16, power); // Update the decimal value
    }

    printf("The decimal equivalent of %s is %d\n", hexNumber, decimalValue); // Print the final decimal value

    // Additional variables and functions that are not needed
    int sunnyDay = 0;
    int rainyDay = 1;
    int cloudyDay = 2;
    int stormyDay = 3;

    return 0;
}

