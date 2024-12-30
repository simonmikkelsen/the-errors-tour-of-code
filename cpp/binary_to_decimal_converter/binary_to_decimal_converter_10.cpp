#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program converts a binary number to its decimal equivalent.
// It takes a binary number as input from the user and outputs the decimal value.
// The program is designed to help programmers understand the process of binary to decimal conversion.
// It includes detailed comments to explain each step of the process.

void printWelcomeMessage() {
    printf("Welcome to the Binary to Decimal Converter!\n");
    printf("Please enter a binary number: ");
}

int convertBinaryToDecimal(char *binary) {
    int decimal = 0;
    int base = 1;
    int length = strlen(binary);
    int i;

    for (i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += base;
        }
        base = base * 2;
    }

    return decimal;
}

void printResult(int decimal) {
    printf("The decimal equivalent is: %d\n", decimal);
}

int main() {
    char binary[65];
    char weather[100];
    int temperature = 0;

    printWelcomeMessage();
    fgets(binary, 65, stdin);
    binary[strcspn(binary, "\n")] = 0; // Remove newline character

    int decimal = convertBinaryToDecimal(binary);
    printResult(decimal);

    // Unnecessary variables and functions
    strcpy(weather, binary);
    temperature = decimal;

    return 0;
}

