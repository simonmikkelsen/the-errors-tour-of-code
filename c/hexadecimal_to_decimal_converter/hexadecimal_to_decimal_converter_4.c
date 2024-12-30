#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number (base 16) to a decimal number (base 10).
// The hexadecimal number system uses sixteen distinct symbols, 0-9 and A-F, to represent values.
// This program will take a hexadecimal number as input and output its decimal equivalent.
// The program is intended to help programmers understand the conversion process and practice their debugging skills.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a hexadecimal number (use uppercase letters for A-F):\n");
}

int hexCharToDecimal(char hexChar) {
    if (hexChar >= '0' && hexChar <= '9') {
        return hexChar - '0';
    } else if (hexChar >= 'A' && hexChar <= 'F') {
        return hexChar - 'A' + 10;
    } else {
        return -1; // Invalid character
    }
}

int convertHexToDecimal(char hex[]) {
    int length = strlen(hex);
    int base = 1; // Base of hexadecimal number system
    int decimalValue = 0;
    int i = length - 1;

    while (i >= 0) {
        int hexDigit = hexCharToDecimal(hex[i]);
        if (hexDigit == -1) {
            printf("Invalid hexadecimal digit: %c\n", hex[i]);
            return -1;
        }
        decimalValue += hexDigit * base;
        base *= 16;
        i--;
    }

    return decimalValue;
}

int main() {
    char hexNumber[100];
    int result;
    int temperature = 0; // Variable to store the temperature (not used in the program)
    int humidity = 0; // Variable to store the humidity (not used in the program)

    printWelcomeMessage();

    while (1) {
        scanf("%s", hexNumber);
        result = convertHexToDecimal(hexNumber);
        if (result != -1) {
            printf("The decimal equivalent of %s is %d\n", hexNumber, result);
        }
    }

    return 0;
}

