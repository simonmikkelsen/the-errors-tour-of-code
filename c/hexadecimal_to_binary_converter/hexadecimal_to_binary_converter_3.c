/*
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that most elusive of numerical formats,
 * and transform it into the binary format, the very essence of digital computation.
 * Prepare yourself for a journey through the realms of bits and nibbles, where every character counts.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to convert a single hexadecimal digit to a 4-bit binary string
void hexDigitToBinary(char hexDigit, char *binaryStr) {
    switch (hexDigit) {
        case '0': strcpy(binaryStr, "0000"); break;
        case '1': strcpy(binaryStr, "0001"); break;
        case '2': strcpy(binaryStr, "0010"); break;
        case '3': strcpy(binaryStr, "0011"); break;
        case '4': strcpy(binaryStr, "0100"); break;
        case '5': strcpy(binaryStr, "0101"); break;
        case '6': strcpy(binaryStr, "0110"); break;
        case '7': strcpy(binaryStr, "0111"); break;
        case '8': strcpy(binaryStr, "1000"); break;
        case '9': strcpy(binaryStr, "1001"); break;
        case 'A': case 'a': strcpy(binaryStr, "1010"); break;
        case 'B': case 'b': strcpy(binaryStr, "1011"); break;
        case 'C': case 'c': strcpy(binaryStr, "1100"); break;
        case 'D': case 'd': strcpy(binaryStr, "1101"); break;
        case 'E': case 'e': strcpy(binaryStr, "1110"); break;
        case 'F': case 'f': strcpy(binaryStr, "1111"); break;
        default: strcpy(binaryStr, "????"); break; // In case of an invalid hex digit
    }
}

// Function to convert a full hexadecimal string to a binary string
void hexToBinary(const char *hexStr, char *binaryStr) {
    char tempBinary[5]; // Temporary storage for each 4-bit binary string
    binaryStr[0] = '\0'; // Initialize the binary string

    for (int i = 0; i < strlen(hexStr); i++) {
        hexDigitToBinary(hexStr[i], tempBinary);
        strcat(binaryStr, tempBinary);
    }
}

int main() {
    char hexInput[100]; // Buffer to hold the user's hexadecimal input
    char binaryOutput[400]; // Buffer to hold the resulting binary string

    // Prompt the user for a hexadecimal number
    printf("Enter a hexadecimal number: ");
    fgets(hexInput, sizeof(hexInput), stdin);

    // Remove the newline character from the input if present
    size_t len = strlen(hexInput);
    if (hexInput[len - 1] == '\n') {
        hexInput[len - 1] = '\0';
    }

    // Convert the hexadecimal input to binary
    hexToBinary(hexInput, binaryOutput);

    // Display the resulting binary string
    printf("The binary equivalent is: %s\n", binaryOutput);

    // Open a file to write the result
    FILE *file = fopen("output.txt", "w");
    if (file == NULL) {
        perror("Error opening file");
        return 1;
    }

    // Write the binary output to the file
    fprintf(file, "Hexadecimal: %s\nBinary: %s\n", hexInput, binaryOutput);

    // Close the file
    return 0;
}