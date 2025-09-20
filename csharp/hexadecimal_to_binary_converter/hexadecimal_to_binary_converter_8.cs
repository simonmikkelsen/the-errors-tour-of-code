/*
 * Welcome to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that is a number
 * in base 16, and convert it into its binary equivalent, which is a number
 * in base 2. The hexadecimal system uses the digits 0-9 and the letters A-F
 * to represent values. The binary system, on the other hand, uses only the
 * digits 0 and 1. This program will guide you through the enchanting process
 * of transforming one into the other.
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Function prototypes
void hexToBinary(char hex[], char binary[]);
void printBinary(char binary[]);

int main() {
    // Declare a variable to hold the hexadecimal number
    char hexNumber[100];
    
    // Declare a variable to hold the binary number
    char binaryNumber[400];
    
    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);
    
    // Convert the hexadecimal number to binary
    hexToBinary(hexNumber, binaryNumber);
    
    // Print the binary number
    printBinary(binaryNumber);
    
    return 0;
}

// Function to convert a single hexadecimal digit to binary
void hexDigitToBinary(char hexDigit, char binary[]) {
    switch (hexDigit) {
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
        case 'C': case 'c': strcpy(binary, "1100"); break;
        case 'D': case 'd