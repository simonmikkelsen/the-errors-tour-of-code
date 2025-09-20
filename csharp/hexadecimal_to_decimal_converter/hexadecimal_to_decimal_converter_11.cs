#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program is designed to convert hexadecimal numbers to decimal numbers.
// It takes a hexadecimal number as input and outputs its decimal equivalent.
// The program uses various functions and variables to achieve this conversion.
// The purpose of this program is to provide a detailed example of how to work with strings and numbers in C.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a hexadecimal number (e.g., 1A3F): ");
}

int isValidHexadecimal(const char *hex) {
    // This function checks if the input string is a valid hexadecimal number.
    // It uses regular expressions to perform the validation.
    regex_t regex;
    int reti;
    reti = regcomp(&regex, "^[0-9A-Fa-f]+$", 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }
    reti = regexec(&regex, hex, 0, NULL, 0);
    regfree(&regex);
    return !reti;
}

int hexCharToDecimal(char c) {
    // This function converts a single hexadecimal character to its decimal equivalent.
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

int convertHexToDecimal(const char *hex) {
    // This function converts a hexadecimal string to its decimal equivalent.
    int length = strlen(hex);
    int base = 1;
    int decimal = 0;
    int i;
    for (i = length - 1; i >= 0; i--) {
        int value = hexCharToDecimal(hex[i]);
        if (value == -1) {
            printf("Invalid hexadecimal character: %c\n", hex[i]);
            return -1;
        }
        decimal += value * base;
        base *= 16;
    }
    return decimal;
}

int main() {
    // The main function of the program.
    // It handles user input and calls the necessary functions to perform the conversion.
    char hex[100];
    printWelcomeMessage();
    scanf("%s", hex);
    if (!isValidHexadecimal(hex)) {
        printf("Invalid hexadecimal number.\n");
        return 1;
    }
    int decimal = convertHexToDecimal(hex);
    if (decimal != -1) {
        printf("The decimal equivalent of %s is %d\n", hex, decimal);
    }
    return 0;
}

