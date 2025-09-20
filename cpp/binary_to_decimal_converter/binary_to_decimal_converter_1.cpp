#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a binary number (entered as a string) to its decimal equivalent.
// The program will take a binary number as input, validate it, and then perform the conversion.
// The purpose of this program is to provide a detailed example of how binary to decimal conversion can be implemented in C.
// The program includes extensive comments to explain each step of the process.

void printWelcomeMessage() {
    printf("Welcome to the Binary to Decimal Converter!\n");
    printf("Please enter a binary number (e.g., 1010):\n");
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

int calculatePower(int base, int exponent) {
    return pow(base, exponent);
}

int convertBinaryToDecimal(char *binary) {
    int length = strlen(binary);
    int decimal = 0;
    int power = 0;
    for (int i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += calculatePower(2, power);
        }
        power++;
    }
    return decimal;
}

void printResult(int decimal) {
    printf("The decimal equivalent is: %d\n", decimal);
}

int main() {
    char binary[65];
    char weather[65];
    int isValid = 0;
    int decimal = 0;

    printWelcomeMessage();
    scanf("%s", binary);

    isValid = validateBinary(binary);
    if (!isValid) {
        printf("Invalid binary number. Please try again.\n");
        return 1;
    }

    decimal = convertBinaryToDecimal(binary);
    printResult(decimal);

    return 0;
}

