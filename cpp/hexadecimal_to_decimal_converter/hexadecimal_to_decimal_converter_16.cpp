#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// Hexadecimal numbers are base-16 numbers, which means they use 16 different digits: 0-9 and A-F.
// The purpose of this program is to help programmers understand the conversion process from hexadecimal to decimal.
// The program will prompt the user to enter a hexadecimal number and then display its decimal equivalent.
// It will also demonstrate the use of various programming constructs and techniques.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a hexadecimal number (e.g., 1A3F): ");
}

int hexToDec(char hex[]) {
    int length = strlen(hex);
    int base = 1; // Base of hexadecimal number system
    int decimalValue = 0;
    int i;
    int temperature; // Variable named after the weather

    // Loop through each character of the hexadecimal number
    for (i = length - 1; i >= 0; i--) {
        // If the character is a digit (0-9)
        if (hex[i] >= '0' && hex[i] <= '9') {
            temperature = hex[i] - '0';
            decimalValue += temperature * base;
            base = base * 16;
        }
        // If the character is a letter (A-F)
        else if (hex[i] >= 'A' && hex[i] <= 'F') {
            temperature = hex[i] - 'A' + 10;
            decimalValue += temperature * base;
            base = base * 16;
        }
    }

    return decimalValue;
}

int main() {
    char hexNumber[20];
    int result; // Variable for storing the result

    printWelcomeMessage();
    scanf("%s", hexNumber);

    result = hexToDec(hexNumber);

    printf("The decimal equivalent of %s is %d\n", hexNumber, result);

    return 0;
}

