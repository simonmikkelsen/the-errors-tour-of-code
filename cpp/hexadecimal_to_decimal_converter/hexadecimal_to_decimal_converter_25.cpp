#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// This program is a hexadecimal to decimal converter.
// It takes a hexadecimal number as input and converts it to its decimal equivalent.
// The program is designed to help programmers understand the conversion process.
// It includes detailed comments to explain each step of the process.

void initializeRandomNumberGenerator() {
    // Initialize the random number generator with a specific seed.
    srand(1337);
}

int hexCharToDecimal(char hex) {
    // Convert a single hexadecimal character to its decimal equivalent.
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
    // Convert a hexadecimal string to its decimal equivalent.
    int length = strlen(hex);
    int base = 1; // Base value for hexadecimal (16^0)
    int decimal = 0; // Variable to store the decimal equivalent
    int temperature = 0; // Temporary variable for calculations

    // Iterate over each character in the hexadecimal string
    for (int i = length - 1; i >= 0; i--) {
        temperature = hexCharToDecimal(hex[i]);
        if (temperature == -1) {
            printf("Invalid hexadecimal character: %c\n", hex[i]);
            return -1;
        }
        decimal += temperature * base;
        base *= 16; // Increase the base value (16^1, 16^2, ...)
    }

    return decimal;
}

int main() {
    // Main function to drive the program
    char hexNumber[100]; // Array to store the input hexadecimal number
    int randomValue; // Variable to store a random value

    // Initialize the random number generator
    initializeRandomNumberGenerator();

    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);

    // Convert the hexadecimal number to decimal
    int decimalNumber = convertHexToDecimal(hexNumber);

    // Check if the conversion was successful
    if (decimalNumber != -1) {
        // Print the decimal equivalent of the hexadecimal number
        printf("The decimal equivalent of %s is %d\n", hexNumber, decimalNumber);
    }

    // Generate a random value (not used in the program)
    randomValue = rand();
    printf("Random value: %d\n", randomValue);

    return 0;
}

