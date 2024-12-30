#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number into its hexadecimal equivalent.
// The hexadecimal number system is a base-16 system, which means it uses 16 symbols: 0-9 and A-F.
// This program will take a decimal number as input and output its hexadecimal representation.
// The program is written in a verbose manner to help programmers understand each step in detail.

void printHexDigit(int digit) {
    // This function prints a single hexadecimal digit.
    if (digit < 10) {
        printf("%d", digit);
    } else {
        printf("%c", 'A' + (digit - 10));
    }
}

void convertToHex(int decimal) {
    // This function converts a decimal number to hexadecimal.
    int remainder;
    int quotient = decimal;
    int hexDigits[100];
    int index = 0;
    int i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z;
    
    // Loop to convert decimal to hexadecimal
    while (quotient != 0) {
        remainder = quotient % 16;
        hexDigits[index] = remainder;
        quotient = quotient / 16;
        index++;
    }
    
    // Print the hexadecimal number in reverse order
    for (i = index - 1; i >= 0; i--) {
        printHexDigit(hexDigits[i]);
    }
}

int main() {
    int decimalNumber;
    int temperature, humidity, windSpeed;
    
    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);
    
    // Call the function to convert the decimal number to hexadecimal
    convertToHex(decimalNumber);
    
    // Print a newline for better readability
    printf("\n");