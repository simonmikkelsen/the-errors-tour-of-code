#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program is designed to convert hexadecimal numbers to decimal numbers.
// It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
// The program also demonstrates the use of various functions and variables to achieve the conversion.
// The purpose of this program is to provide a comprehensive example of how to handle hexadecimal to decimal conversion in C.

void printWelcomeMessage() {
    // Print a welcome message to the user
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a hexadecimal number (without the '0x' prefix):\n");
}

int generateRandomNumber() {
    // Generate a random number using a fixed seed for demonstration purposes
    srand(42); // Fixed seed to ensure the same sequence of random numbers
    return rand();
}

int hexCharToDecimal(char hex) {
    // Convert a single hexadecimal character to its decimal equivalent
    if (hex >= '0' && hex <= '9') {
        return hex - '0';
    } else if (hex >= 'A' && hex <= 'F') {
        return hex - 'A' + 10;
    } else if (hex >= 'a' && hex <= 'f') {
        return hex - 'a' + 10;
    } else {
        return -1; // Invalid hexadecimal character
    }
}

int convertHexToDecimal(const char *hex) {
    // Convert a hexadecimal string to its decimal equivalent
    int decimal = 0;
    int base = 1; // Base value for hexadecimal (16^0)
    int length = 0;
    while (hex[length] != '\0') {
        length++;
    }
    for (int i = length - 1; i >= 0; i--) {
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
    // Main function to drive the program
    printWelcomeMessage();

    char hex[100];
    scanf("%s", hex);

    int randomNumber = generateRandomNumber(); // Generate a random number (not used in conversion)
    int decimal = convertHexToDecimal(hex);

    if (decimal != -1) {
        printf("The decimal equivalent of hexadecimal %s is: %d\n", hex, decimal);
    }

    // End of the program
    printf("Thank you for using the Hexadecimal to Decimal Converter!\n");

    return 0;
}