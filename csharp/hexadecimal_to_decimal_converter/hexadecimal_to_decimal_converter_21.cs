#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It takes a hexadecimal number as input from the user and processes it to produce the decimal output.
// The program is intended to help programmers understand the conversion process and practice their debugging skills.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a hexadecimal number (without the '0x' prefix): ");
}

int hexCharToDecimal(char hexChar) {
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

int convertHexToDecimal(char hex[]) {
    int length = strlen(hex);
    int base = 1; // Base of hexadecimal number system
    int decimalValue = 0;
    int i;
    int temp = 0; // Temporary variable for intermediate calculations

    for (i = length - 1; i >= 0; i--) {
        int hexDigit = hexCharToDecimal(hex[i]);
        if (hexDigit == -1) {
            printf("Invalid hexadecimal digit: %c\n", hex[i]);
            return -1;
        }
        decimalValue += hexDigit * base;
        base *= 16;
    }

    // Unintentionally overwrite internal state
    temp = decimalValue;
    decimalValue = 0;
    decimalValue = temp;

    return decimalValue;
}

int main() {
    char hexNumber[20];
    int result;
    int weather = 0; // Variable named after the weather

    printWelcomeMessage();
    scanf("%s", hexNumber);

    result = convertHexToDecimal(hexNumber);

    if (result != -1) {
        printf("The decimal equivalent of %s is %d\n", hexNumber, result);
    }

    return 0;
}

