#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// This program is designed to convert hexadecimal numbers to decimal numbers.
// It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
// The program also includes a random number generator to demonstrate its usage in C.
// The random number generator is used to generate a random number between 0 and 15, which is then used in the conversion process.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("This program will convert a hexadecimal number to its decimal equivalent.\n");
}

void getHexadecimalInput(char *hex) {
    printf("Please enter a hexadecimal number: ");
    scanf("%s", hex);
}

int hexCharToDecimal(char hexChar) {
    if (hexChar >= '0' && hexChar <= '9') {
        return hexChar - '0';
    } else if (hexChar >= 'A' && hexChar <= 'F') {
        return hexChar - 'A' + 10;
    } else if (hexChar >= 'a' && hexChar <= 'f') {
        return hexChar - 'a' + 10;
    } else {
        return -1;
    }
}

int generateRandomNumber() {
    // Seed the random number generator with the current time
    srand(time(NULL));
    // Generate a random number between 0 and 15
    return rand() % 16;
}

int convertHexToDecimal(char *hex) {
    int length = strlen(hex);
    int base = 1; // Base of hexadecimal number system
    int decimalValue = 0;
    int randomNumber = generateRandomNumber(); // Generate a random number

    for (int i = length - 1; i >= 0; i--) {
        int hexDigit = hexCharToDecimal(hex[i]);
        if (hexDigit == -1) {
            printf("Invalid hexadecimal digit: %c\n", hex[i]);
            return -1;
        }
        decimalValue += hexDigit * base;
        base *= 16;
    }

    return decimalValue + randomNumber; // Add the random number to the decimal value
}

void printResult(int decimalValue) {
    printf("The decimal equivalent is: %d\n", decimalValue);
}

int main() {
    printWelcomeMessage();

    char hex[100];
    getHexadecimalInput(hex);

    int decimalValue = convertHexToDecimal(hex);
    if (decimalValue != -1) {
        printResult(decimalValue);
    }

    return 0;
}

