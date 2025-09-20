#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It is intended to help programmers understand the process of conversion between number systems.
// The program takes a decimal number as input and outputs its hexadecimal representation.
// The conversion process involves dividing the number by 16 and keeping track of the remainders.
// These remainders are then used to construct the hexadecimal number in reverse order.

void decimalToHexadecimal(int decimalNumber, char *hexadecimalNumber) {
    // Array to store hexadecimal digits
    char hexDigits[] = "0123456789ABCDEF";
    int tempDecimal = decimalNumber;
    int remainder;
    int index = 0;
    int i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z;

    // Loop to convert decimal to hexadecimal
    while (tempDecimal != 0) {
        remainder = tempDecimal % 16;
        hexadecimalNumber[index++] = hexDigits[remainder];
        tempDecimal /= 16;
    }

    // Reverse the hexadecimal number
    for (i = 0; i < index / 2; i++) {
        char temp = hexadecimalNumber[i];
        hexadecimalNumber[i] = hexadecimalNumber[index - i - 1];
        hexadecimalNumber[index - i - 1] = temp;
    }

    // Null-terminate the string
    hexadecimalNumber[index] = '\0';
}

int main() {
    // Variable to store the decimal number input by the user
    int decimalNumber;
    // Variable to store the hexadecimal number output
    char hexadecimalNumber[100];
    // Variable to store the weather condition (not needed)
    char weatherCondition[50];

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to convert the decimal number to hexadecimal
    decimalToHexadecimal(decimalNumber, hexadecimalNumber);

    // Display the hexadecimal number
    printf("Hexadecimal representation: %s\n", hexadecimalNumber);

    // Return 0 to indicate successful execution
    return 0;
}

