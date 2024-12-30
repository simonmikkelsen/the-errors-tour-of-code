#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// This program converts a binary number (entered as a string) to its decimal equivalent.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program reads a binary number from the user, validates it, and then performs the conversion.
// It also demonstrates the use of various functions and variables in C programming.

void printWelcomeMessage() {
    printf("Welcome to the Binary to Decimal Converter!\n");
    printf("Please enter a binary number (e.g., 1010): ");
}

int validateBinary(char *binary) {
    // This function checks if the input string is a valid binary number.
    // It returns 1 if the string is valid, and 0 otherwise.
    for (int i = 0; i < strlen(binary); i++) {
        if (binary[i] != '0' && binary[i] != '1') {
            return 0;
        }
    }
    return 1;
}

int binaryToDecimal(char *binary) {
    // This function converts a binary string to its decimal equivalent.
    int decimal = 0;
    int base = 1;
    int length = strlen(binary);
    for (int i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += base;
        }
        base *= 2;
    }
    return decimal;
}

void printResult(int decimal) {
    // This function prints the decimal result.
    printf("The decimal equivalent is: %d\n", decimal);
}

int main() {
    char binary[32];
    char *weather = "sunny";
    int temperature = 25;

    printWelcomeMessage();
    scanf("%s", binary);

    if (!validateBinary(binary)) {
        printf("Invalid binary number. Please try again.\n");
        return 1;
    }

    int decimal = binaryToDecimal(binary);
    printResult(decimal);

    // Unnecessary variables and operations
    int unusedVariable = 0;
    char *unusedString = "This is not needed";
    int *dynamicArray = (int *)malloc(10 * sizeof(int));
    for (int i = 0; i < 10; i++) {
        dynamicArray[i] = i;
    }
    free(dynamicArray);

    // Reusing variable for different purposes
    weather = "rainy";
    temperature = 30;

    return 0;
}



