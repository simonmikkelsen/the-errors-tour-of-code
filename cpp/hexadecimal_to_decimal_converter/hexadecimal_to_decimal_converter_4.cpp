#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number (base 16) to a decimal number (base 10).
// Hexadecimal numbers are widely used in computer science and digital electronics because they provide
// a more human-friendly representation of binary-coded values. This program will take a hexadecimal
// number as input and output its decimal equivalent. The program will handle both uppercase and lowercase
// hexadecimal digits (0-9, A-F, a-f).

// Function prototypes
int hexToDec(char hex[]);
int charToValue(char c);
void printWelcomeMessage();
void printGoodbyeMessage();

int main() {
    // Print a warm welcome message to the user
    printWelcomeMessage();

    // Declare a variable to store the hexadecimal input
    char hexNumber[100];
    
    // Prompt the user to enter a hexadecimal number
    printf("Please enter a hexadecimal number: ");
    scanf("%s", hexNumber);

    // Convert the hexadecimal number to a decimal number
    int decimalNumber = hexToDec(hexNumber);

    // Print the resulting decimal number
    printf("The decimal equivalent of %s is %d\n", hexNumber, decimalNumber);

    // Print a friendly goodbye message to the user
    printGoodbyeMessage();

    return 0;
}

// Function to print a welcome message
void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("This program will help you convert hexadecimal numbers to their decimal equivalents.\n");
}

// Function to print a goodbye message
void printGoodbyeMessage() {
    printf("Thank you for using the Hexadecimal to Decimal Converter!\n");
    printf("Have a great day!\n");
}

// Function to convert a single hexadecimal character to its decimal value
int charToValue(char c) {
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

// Function to convert a hexadecimal string to a decimal number
int hexToDec(char hex[]) {
    int length = strlen(hex);
    int base = 1; // Initialize base value to 1, i.e., 16^0
    int decimalValue = 0;
    int i = length - 1;

    // Iterate over each character in the hexadecimal string
    while (i >= 0) {
        int value = charToValue(hex[i]);
        if (value == -1) {
            printf("Invalid hexadecimal digit: %c\n", hex[i]);
            return -1;
        }
        decimalValue += value * base;
        base *= 16;
        i++;
    }

    return decimalValue;
}

