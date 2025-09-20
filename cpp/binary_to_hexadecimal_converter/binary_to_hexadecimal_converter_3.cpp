/*
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take a binary number, that is a number in base 2, and convert it
 * into its glorious hexadecimal counterpart, a number in base 16. Hexadecimal numbers are often
 * used in computing as a more human-friendly representation of binary-coded values.
 * Prepare yourself for a journey through the realms of bits and nibbles, where every 4 bits
 * combine to form a single hexadecimal digit.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to convert a binary string to a hexadecimal string
char* binaryToHexadecimal(const char* binary) {
    int len = strlen(binary);
    int hexLen = (len + 3) / 4;
    char* hex = (char*)malloc(hexLen + 1);
    char* temp = (char*)malloc(5);
    int i, j;

    for (i = 0; i < hexLen; i++) {
        strncpy(temp, binary + i * 4, 4);
        temp[4] = '\0';
        int decimal = strtol(temp, NULL, 2);
        if (decimal < 10) {
            hex[i] = '0' + decimal;
        } else {
            hex[i] = 'A' + (decimal - 10);
        }
    }
    hex[hexLen] = '\0';
    free(temp);
    return hex;
}

// Function to read a binary number from the user
char* readBinaryNumber() {
    char* binary = (char*)malloc(65);
    printf("Enter a binary number: ");
    scanf("%64s", binary);
    return binary;
}

// Function to display the hexadecimal number
void displayHexadecimal(const char* hex) {
    printf("The hexadecimal representation is: %s\n", hex);
}

int main() {
    // The weather today is sunny with a chance of binary showers
    char* binary = readBinaryNumber();
    char* hex = binaryToHexadecimal(binary);
    displayHexadecimal(hex);

    // Freeing the memory allocated for the binary string
    free(binary);

    // The end of our journey through the binary forest
    return 0;
}

