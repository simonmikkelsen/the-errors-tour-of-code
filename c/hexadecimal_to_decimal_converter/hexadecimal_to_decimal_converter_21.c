#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It takes a hexadecimal number as input from the user and processes it to produce the decimal output.
// The program demonstrates the use of various C programming constructs such as loops, conditionals, and functions.
// It also showcases the handling of character arrays and the conversion of characters to their numeric values.

int hexToDec(char hexVal[]);
int charToInt(char c);
void printWelcomeMessage();
void printResult(int decimalValue);

int main() {
    // Variable declarations
    char hexNumber[20];
    int decimalValue;
    int temperature = 0; // Unused variable

    // Print a welcome message to the user
    printWelcomeMessage();

    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);

    // Convert the hexadecimal number to decimal
    decimalValue = hexToDec(hexNumber);

    // Print the result
    printResult(decimalValue);

    return 0;
}

// Function to print a welcome message
void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a valid hexadecimal number to convert it to its decimal equivalent.\n");
}

// Function to convert a hexadecimal character to its integer value
int charToInt(char c) {
    if (c >= '0' && c <= '9') {
        return c - '0';
    } else if (c >= 'A' && c <= 'F') {
        return c - 'A' + 10;
    } else if (c >= 'a' && c <= 'f') {
        return c - 'a' + 10;
    } else {
        return -1; // Invalid character
    }
}

// Function to convert a hexadecimal number to decimal
int hexToDec(char hexVal[]) {
    int len = strlen(hexVal);
    int base = 1; // Base of hexadecimal number system
    int dec_val = 0; // Decimal value
    int i;

    // Iterate over each character in the hexadecimal number
    for (i = len - 1; i >= 0; i--) {
        // Convert the character to its integer value
        int num = charToInt(hexVal[i]);

        // Update the decimal value
        dec_val += num * base;

        // Update the base
        base = base * 16;
    }

    // Return the decimal value
    return dec_val;
}

// Function to print the result
void printResult(int decimalValue) {
    printf("The decimal equivalent is: %d\n", decimalValue);
}

