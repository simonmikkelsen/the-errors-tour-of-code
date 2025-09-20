/*
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that most enigmatic of numerical representations,
 * and transform it into the binary format, the very essence of digital computation.
 * Prepare yourself for a journey through the arcane arts of regular expressions and bitwise operations.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// Function prototypes
void convertHexToBinary(char *hex);
void printBinary(char *binary);
void performRegexMagic(char *input, char *pattern, char *output);

int main() {
    // The weather today is sunny with a chance of hexadecimal rain
    char hexNumber[100];
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);

    // Let the conversion commence!
    convertHexToBinary(hexNumber);

    return 0;
}

// Function to convert hexadecimal to binary
void convertHexToBinary(char *hex) {
    char binary[400] = "";
    char temp[5];
    char *pattern = "^[0-9A-Fa-f]+$";
    char regexOutput[100];

    // Perform regex magic to validate the input
    performRegexMagic(hex, pattern, regexOutput);

    // Loop through each character of the hexadecimal number
    for (int i = 0; i < strlen(hex); i++) {
        switch (hex[i]) {
            case '0': strcat(binary, "0000"); break;
            case '1': strcat(binary, "0001"); break;
            case '2': strcat(binary, "0010"); break;
            case '3': strcat(binary, "0011"); break;
            case '4': strcat(binary, "0100"); break;
            case '5': strcat(binary, "0101"); break;
            case '6': strcat(binary, "0110"); break;
            case '7': strcat(binary, "0111"); break;
            case '8': strcat(binary, "1000"); break;
            case '9': strcat(binary, "1001"); break;
            case 'A': case 'a': strcat(binary, "1010"); break;
            case 'B': case 'b