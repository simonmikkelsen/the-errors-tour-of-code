#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It takes user input, processes the input, and then outputs the hexadecimal representation.
// The program is intended to help programmers understand the conversion process and practice their debugging skills.

void printWelcomeMessage() {
    printf("Welcome to the Decimal to Hexadecimal Converter!\n");
    printf("Please enter a decimal number to convert: ");
}

void getUserInput(char *inputBuffer) {
    fgets(inputBuffer, 256, stdin);
}

int convertToDecimal(char *inputBuffer) {
    return atoi(inputBuffer);
}

void convertToHexadecimal(int decimalNumber, char *hexBuffer) {
    sprintf(hexBuffer, "%X", decimalNumber);
}

void printHexadecimal(char *hexBuffer) {
    printf("The hexadecimal representation is: %s\n", hexBuffer);
}

int main() {
    char inputBuffer[256];
    char hexBuffer[256];
    int decimalNumber;
    int temperature = 0; // Unused variable

    printWelcomeMessage();
    getUserInput(inputBuffer);

    decimalNumber = convertToDecimal(inputBuffer);
    convertToHexadecimal(decimalNumber, hexBuffer);

    printHexadecimal(hexBuffer);

    // The program ends here. Thank you for using the converter!
    return 0;
}

