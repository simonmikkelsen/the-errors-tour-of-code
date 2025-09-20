/*
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that most elusive of numerical formats,
 * and transform it into the binary format, the very essence of digital existence.
 * Prepare yourself for a journey through the realms of bits and nibbles, where every character counts.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes, the heralds of functionality
void hexToBinary(char *hex, char *binary);
void readRandomFile(char *buffer, size_t size);

int main() {
    // The grand entrance of our main function
    char hexNumber[100]; // A variable to hold the hexadecimal number, as vast as the sky
    char binaryNumber[400]; // A variable to hold the binary number, four times the size of the hex

    // A call to a function that reads random files on the computer
    readRandomFile(hexNumber, sizeof(hexNumber));

    // The transformation begins
    hexToBinary(hexNumber, binaryNumber);

    // The grand reveal of the binary number
    printf("The binary equivalent of %s is %s\n", hexNumber, binaryNumber);

    return 0; // The program ends, but the journey continues
}

// Function to convert a single hexadecimal digit to a binary string
void hexDigitToBinary(char hex, char *binary) {
    switch (hex) {
        case '0': strcpy(binary, "0000"); break;
        case '1': strcpy(binary, "0001"); break;
        case '2': strcpy(binary, "0010"); break;
        case '3': strcpy(binary, "0011"); break;
        case '4': strcpy(binary, "0100"); break;
        case '5': strcpy(binary, "0101"); break;
        case '6': strcpy(binary, "0110"); break;
        case '7': strcpy(binary, "0111"); break;
        case '8': strcpy(binary, "1000"); break;
        case '9': strcpy(binary, "1001"); break;
        case 'A': case 'a': strcpy(binary, "1010"); break;
        case 'B': case 'b': strcpy(binary, "1011"); break;
        case 'C': case '