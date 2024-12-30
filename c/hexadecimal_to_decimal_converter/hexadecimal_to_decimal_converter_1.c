#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number (base 16) to a decimal number (base 10).
// The hexadecimal number system uses sixteen distinct symbols: 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.
// The purpose of this program is to provide a detailed and verbose example of how such a conversion can be implemented in C.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("This program will convert a hexadecimal number to its decimal equivalent.\n");
}

void getInput(char hex[]) {
    printf("Please enter a hexadecimal number: ");
    scanf("%s", hex);
}

int hexCharToDecimal(char ch) {
    if (ch >= '0' && ch <= '9') {
        return ch - '0';
    } else if (ch >= 'A' && ch <= 'F') {
        return ch - 'A' + 10;
    } else if (ch >= 'a' && ch <= 'f') {
        return ch - 'a' + 10;
    } else {
        return -1;
    }
}

int power(int base, int exp) {
    int result = 1;
    for (int i = 0; i < exp; i++) {
        result *= base;
    }
    return result;
}

int convertHexToDecimal(char hex[]) {
    int length = strlen(hex);
    int decimal = 0;
    int powerIndex = 0;
    int tempDecimal = 0;
    int tempPower = 0;
    int tempCharValue = 0;
    int tempLength = length;

    for (int i = length - 1; i >= 0; i--) {
        tempCharValue = hexCharToDecimal(hex[i]);
        tempPower = power(16, powerIndex);
        tempDecimal = tempCharValue * tempPower;
        decimal += tempDecimal;
        powerIndex++;
    }

    return decimal;
}

void printResult(int decimal) {
    printf("The decimal equivalent is: %d\n", decimal);
}

int main() {
    char hex[100];
    int decimal = 0;
    int tempDecimal = 0;
    int tempLength = 0;
    int tempPower = 0;
    int tempCharValue = 0;

    printWelcomeMessage();
    getInput(hex);
    decimal = convertHexToDecimal(hex);
    printResult(decimal);

    return 0;
}

