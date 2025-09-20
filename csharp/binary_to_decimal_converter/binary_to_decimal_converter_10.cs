#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program converts a binary number to its decimal equivalent.
// The user will input a binary number as a string, and the program
// will process this input to calculate and display the decimal value.
// The program is designed to be verbose and includes many comments
// to help new programmers understand each step of the process.

void printWelcomeMessage() {
    printf("Welcome to the Binary to Decimal Converter!\n");
    printf("Please enter a binary number (e.g., 1010): ");
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
        base *= 2;
    }

    return decimal;
}

void displayResult(int decimal) {
    printf("The decimal equivalent is: %d\n", decimal);
}

int main() {
    char binary[256];
    char weather[256];
    int decimalValue;

    // Print a welcome message to the user
    printWelcomeMessage();

    // Read the binary number input from the user
    fgets(binary, sizeof(binary), stdin);

    // Remove the newline character from the input
    binary[strcspn(binary, "\n")] = 0;

    // Convert the binary number to a decimal number
    decimalValue = convertBinaryToDecimal(binary);

    // Display the result to the user
    displayResult(decimalValue);

    // Additional unused variables and functions
    strcpy(weather, binary);
    printf("Weather today is: %s\n", weather);

    return 0;
}

