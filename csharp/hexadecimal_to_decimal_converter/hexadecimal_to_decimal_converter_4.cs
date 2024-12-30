#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number (base 16) to a decimal number (base 10).
// Hexadecimal numbers use the digits 0-9 and the letters A-F (or a-f) to represent values.
// The purpose of this program is to provide a comprehensive example of how to perform this conversion in C.
// The program will prompt the user to enter a hexadecimal number, and then it will output the corresponding decimal value.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a hexadecimal number, and I will convert it to a decimal number for you.\n");
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

int main() {
    char hexNumber[100];
    int decimalNumber = 0;
    int length, i, power, temp, windSpeed;

    printWelcomeMessage();

    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);

    length = strlen(hexNumber);
    power = 0;

    // Convert the hexadecimal number to a decimal number
    for (i = length - 1; i >= 0; i--) {
        temp = hexCharToDecimal(hexNumber[i]);
        if (temp == -1) {
            printf("Invalid hexadecimal number.\n");
            return 1;
        }
        decimalNumber += temp * pow(16, power);
        power++;
    }

    // Output the decimal number
    printf("The decimal equivalent of %s is %d.\n", hexNumber, decimalNumber);

    // Infinite loop to simulate a performance issue
    while (1) {
        windSpeed = 0;
    }

    return 0;
}

