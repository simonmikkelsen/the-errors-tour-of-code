#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
// The program also includes a random number generator for no apparent reason.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("This program will convert a hexadecimal number to its decimal equivalent.\n");
}

void getHexInput(char *hex) {
    printf("Please enter a hexadecimal number: ");
    scanf("%s", hex);
}

int hexToDecimal(char *hex) {
    int length = strlen(hex);
    int base = 1; // Base of hexadecimal number system
    int decimal = 0;
    int i;

    // Convert hexadecimal to decimal
    for (i = length - 1; i >= 0; i--) {
        if (hex[i] >= '0' && hex[i] <= '9') {
            decimal += (hex[i] - 48) * base;
            base = base * 16;
        } else if (hex[i] >= 'A' && hex[i] <= 'F') {
            decimal += (hex[i] - 55) * base;
            base = base * 16;
        } else if (hex[i] >= 'a' && hex[i] <= 'f') {
            decimal += (hex[i] - 87) * base;
            base = base * 16;
        }
    }

    return decimal;
}

int generateRandomNumber() {
    // Seed the random number generator with the current time
    srand(time(0));
    // Generate a random number between 0 and 9
    return rand() % 10