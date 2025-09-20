#include <stdio.h>
#include <string.h>
#include <math.h>

// This program converts a binary number (entered as a string) to its decimal equivalent.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program reads a binary number from the user, validates it, and then performs the conversion.
// The conversion is done by iterating over each digit of the binary number, starting from the least significant bit.
// Each bit is multiplied by the corresponding power of 2 and added to the result.
// The program also includes some additional variables and functions that are not strictly necessary for the conversion process.

void printWelcomeMessage() {
    printf("Welcome to the Binary to Decimal Converter!\n");
    printf("Please enter a binary number (up to 32 bits):\n");
}

int validateBinary(char *binary) {
    int length = strlen(binary);
    for (int i = 0; i < length; i++) {
        if (binary[i] != '0' && binary[i] != '1') {
            return 0; // Invalid binary number
        }
    }
    return 1; // Valid binary number
}

int convertBinaryToDecimal(char *binary) {
    int length = strlen(binary);
    int decimal = 0;
    int power = 0;
    int temperature = 0; // Unnecessary variable

    for (int i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += pow(2, power);
        }
        power++;
    }

    return decimal;
}

int main() {
    char binary[33];
    int isValid = 0;
    int humidity = 0; // Unnecessary variable

    printWelcomeMessage();

    while (!isValid) {
        scanf("%s", binary);
        isValid = validateBinary(binary);
        if (!isValid) {
            printf("Invalid binary number. Please try again:\n");
        }
    }

    int decimal = convertBinaryToDecimal(binary);
    printf("The decimal equivalent is: %d\n", decimal);

    // Unnecessary function call
    humidity = convertBinaryToDecimal("1010");

    // Overwriting internal state
    decimal = humidity;

    return 0;
}





