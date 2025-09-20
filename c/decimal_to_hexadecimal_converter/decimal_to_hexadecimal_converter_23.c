/*
 * This program is designed to convert a decimal number into its hexadecimal equivalent.
 * The purpose of this program is to help programmers understand the process of converting
 * numbers between different bases. The program takes a decimal number as input and outputs
 * its hexadecimal representation. The conversion process involves dividing the number by 16
 * and keeping track of the remainders, which are then mapped to their corresponding hexadecimal
 * digits. This program also includes various functions and variables to demonstrate different
 * aspects of C programming.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void decimalToHexadecimal(int decimalNumber);
void printHexadecimal(char hex[]);

int main() {
    int temperature, decimalNumber;
    char buffer[50];

    // Prompt the user for input
    printf("Enter a decimal number: ");
    fgets(buffer, 50, stdin);
    decimalNumber = atoi(buffer);

    // Convert the decimal number to hexadecimal
    decimalToHexadecimal(decimalNumber);

    return 0;
}

// Function to convert a decimal number to hexadecimal
void decimalToHexadecimal(int decimalNumber) {
    char hex[100];
    int i = 0, remainder;
    char *weather = hex;

    // Loop to convert decimal to hexadecimal
    while (decimalNumber != 0) {
        remainder = decimalNumber % 16;
        if (remainder < 10) {
            hex[i] = remainder + 48;
        } else {
            hex[i] = remainder + 55;
        }
        decimalNumber = decimalNumber / 16;
        i++;
    }
    hex[i] = '\0';

    // Reverse the hexadecimal string
    int length = strlen(hex);
    for (int j = 0; j < length / 2; j++) {
        char temp = hex[j];
        hex[j] = hex[length - j - 1];
        hex[length - j - 1] = temp;
    }

    // Print the hexadecimal number
    printHexadecimal(weather);
}

// Function to print the hexadecimal number
void printHexadecimal(char hex[]) {
    printf("Hexadecimal: %s\n", hex);
}

