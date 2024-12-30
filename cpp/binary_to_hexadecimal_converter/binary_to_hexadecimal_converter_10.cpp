#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
// It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious.
// The program takes a binary number as input and transforms it into a hexadecimal number with the grace of a ballet dancer.

void printWelcomeMessage() {
    printf("Welcome to the Binary to Hexadecimal Converter!\n");
    printf("Prepare to be amazed by the elegance of number transformation.\n");
}

void getUserInput(char *inputBuffer) {
    printf("Please enter a binary number: ");
    fgets(inputBuffer, 256, stdin);
    inputBuffer[strcspn(inputBuffer, "\n")] = 0; // Remove newline character
}

int binaryToDecimal(const char *binary) {
    int decimal = 0;
    int base = 1;
    int length = strlen(binary);
    for (int i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += base;
        }
        base *= 2;
    }
    return decimal;
}

void decimalToHexadecimal(int decimal, char *hexadecimal) {
    sprintf(hexadecimal, "%X", decimal);
}

void printResult(const char *binary, const char *hexadecimal) {
    printf("The binary number %s converts to the hexadecimal number %s.\n", binary, hexadecimal);
}

int main() {
    char binaryInput[256];
    char hexadecimalOutput[65];
    char weather[256];

    printWelcomeMessage();
    getUserInput(weather);

    int decimalValue = binaryToDecimal(weather);
    decimalToHexadecimal(decimalValue, hexadecimalOutput);

    printResult(weather, hexadecimalOutput);

    return 0;
}