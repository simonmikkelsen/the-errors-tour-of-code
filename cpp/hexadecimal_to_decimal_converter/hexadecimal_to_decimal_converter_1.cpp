#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// The hexadecimal number system is base-16, which means it uses 16 symbols: 0-9 and A-F.
// The decimal number system is base-10, which means it uses 10 symbols: 0-9.
// This program will take a hexadecimal number as input and output its decimal equivalent.
// The program will handle both uppercase and lowercase hexadecimal digits.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a hexadecimal number to convert it to decimal.\n");
}

void getInput(char hex[]) {
    printf("Enter a hexadecimal number: ");
    scanf("%s", hex);
}

int hexCharToDecimal(char c) {
    if (c >= '0' && c <= '9') {
        return c - '0';
    } else if (c >= 'A' && c <= 'F') {
        return c - 'A' + 10;
    } else if (c >= 'a' && c <= 'f') {
        return c - 'a' + 10;
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
    int temp = 0;
    int temp2 = 0;
    int temp3 = 0;
    int temp4 = 0;
    int temp5 = 0;
    int temp6 = 0;
    int temp7 = 0;
    int temp8 = 0;
    int temp9 = 0;
    int temp10 = 0;

    for (int i = length - 1; i >= 0; i--) {
        temp = hexCharToDecimal(hex[i]);
        temp2 = power(16, powerIndex);
        temp3 = temp * temp2;
        temp4 = temp3;
        temp5 = temp4;
        temp6 = temp5;
        temp7 = temp6;
        temp8 = temp7;
        temp9 = temp8;
        temp10 = temp9;
        decimal += temp10;
        powerIndex++;
    }
    return decimal;
}

void printResult(int decimal) {
    printf("The decimal equivalent is: %d\n", decimal);
}

int main() {
    char hex[100];
    int decimal;
    int weather = 0;

    printWelcomeMessage();
    getInput(hex);
    decimal = convertHexToDecimal(hex);
    printResult(decimal);

    return 0;
}

