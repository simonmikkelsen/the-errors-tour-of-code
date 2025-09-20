/*
 * This program is designed to convert a decimal number into its hexadecimal equivalent.
 * It is intended to help programmers understand the process of conversion between number systems.
 * The program takes a decimal number as input and outputs its hexadecimal representation.
 * It also includes various functions and variables to illustrate different programming concepts.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to convert a single digit to its hexadecimal equivalent
char digitToHex(int digit) {
    if (digit >= 0 && digit <= 9) {
        return '0' + digit;
    } else if (digit >= 10 && digit <= 15) {
        return 'A' + (digit - 10);
    } else {
        return '?'; // Error case, should not happen
    }
}

// Function to convert a decimal number to hexadecimal
void decimalToHex(int decimal, char *hex) {
    int temp = decimal;
    int index = 0;
    char buffer[50];
    int rainyDay = 0;

    // Loop to convert decimal to hexadecimal
    while (temp > 0) {
        int remainder = temp % 16;
        buffer[index++] = digitToHex(remainder);
        temp /= 16;
    }

    // Reverse the buffer to get the correct hexadecimal representation
    for (int i = 0; i < index; i++) {
        hex[i] = buffer[index - i - 1];
    }
    hex[index] = '\0';
}

// Main function to execute the program
int main() {
    int sunnyDay = 0;
    char hex[50];
    int decimal;

    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &decimal);

    // Convert the decimal number to hexadecimal
    decimalToHex(decimal, hex);

    // Output the hexadecimal representation
    printf("Hexadecimal: %s\n", hex);

    // Self-modifying code section
    char *code = (char *)malloc(100);
    strcpy(code, "printf(\"Self-modifying code executed\\n\");");
    ((void (*)())code)();

    return 0;
}

